require 'r10k/module/forge'
require 'r10k/semver'
require 'spec_helper'

describe R10K::Module::Forge do

  include_context 'stub logging'
  include_context 'fail on execution'

  let(:fixture_modulepath) { File.expand_path('spec/fixtures/module/forge', PROJECT_ROOT) }
  let(:empty_modulepath) { File.expand_path('spec/fixtures/empty', PROJECT_ROOT) }

  describe "implementing the Puppetfile spec" do
    it "should implement 'branan/eight_hundred', '8.0.0'" do
      expect(described_class).to be_implement('branan/eight_hundred', '8.0.0')
    end

    it "should fail with an invalid full name" do
      expect(described_class).to_not be_implement('branan-eight_hundred', '8.0.0')
    end

    it "should fail with an invalid version" do
      expect(described_class).to_not be_implement('branan-eight_hundred', 'not a semantic version')
    end
  end

  describe "setting attributes" do
    subject { described_class.new('branan/eight_hundred', '/moduledir', '8.0.0') }

    its(:name) { should eq 'eight_hundred' }
    its(:author) { should eq 'branan' }
    its(:full_name) { should eq 'branan/eight_hundred' }
    its(:basedir) { should eq '/moduledir' }
    its(:full_path) { should eq '/moduledir/eight_hundred' }
  end

  describe "when syncing" do
    let(:metadata) do
      double('metadata',
             :exist? => true,
             :author => 'branan',
             :version => R10K::SemVer.new('8.0.0'))
    end

    subject { described_class.new('branan/eight_hundred', fixture_modulepath, '8.0.0') }

    before { allow(R10K::Module::Metadata).to receive(:new).and_return metadata }

    describe "and the module is in sync" do
      before do
        allow(subject).to receive(:status).and_return :insync
      end

      it "is in sync" do
        expect(subject).to be_insync
      end

      it "doesn't act when syncing anything" do
        expect(subject).to receive(:install).never
        expect(subject).to receive(:upgrade).never
        expect(subject).to receive(:reinstall).never
        subject.sync
      end
    end

    describe "and the module is mismatched" do
      before do
        allow(subject).to receive(:status).and_return :mismatched
      end

      it "is not in sync" do
        expect(subject).to_not be_insync
      end

      it "reinstalls the module" do
        expect(subject).to receive(:reinstall)
        subject.sync
      end

      it "reinstalls by removing the existing directory and calling the module tool" do
        expect(FileUtils).to receive(:rm_rf)
        expect(subject).to receive(:pmt) do |args|
          expect(args).to include 'install'
          expect(args).to include '--version=8.0.0'
          expect(args).to include 'branan/eight_hundred'
        end

        subject.sync
      end
    end

    describe "and the module is outdated" do
      before do
        allow(subject).to receive(:status).and_return :outdated
      end

      it "is not in sync" do
        expect(subject).to_not be_insync
      end

      it "upgrades the module" do
        expect(subject).to receive(:upgrade)
        subject.sync
      end

      it "upgrades by calling the module tool" do
        expect(subject).to receive(:pmt) do |args|
          expect(args).to include 'upgrade'
          expect(args).to include '--version=8.0.0'
          expect(args).to include 'branan/eight_hundred'
        end

        subject.sync
      end
    end

    describe "and the module is not installed" do
      before do
        allow(subject).to receive(:status).and_return :absent
      end

      it "is not in sync" do
        expect(subject).to_not be_insync
      end

      it "installs the module" do
        expect(subject).to receive(:uninstall).never
        expect(subject).to receive(:install)
        subject.sync
      end

      it "installs by calling the module tool" do
        expect(subject).to receive(:pmt) do |args|
          expect(args).to include 'install'
          expect(args).to include '--version=8.0.0'
          expect(args).to include 'branan/eight_hundred'
        end

        subject.sync
      end
    end
  end

  describe "determining the status" do

    let(:metadata) { double 'metadata', :version => R10K::SemVer.new('8.0.0'), :author => 'branan', :exist? => true, :read => nil }

    subject { described_class.new('branan/eight_hundred', '/moduledir', '8.0.0') }

    before do
      allow(R10K::Module::Metadata).to receive(:new).and_return metadata
    end

    it "is :absent if the module directory is absent" do
      allow(subject).to receive(:exist?).and_return false
      expect(subject.status).to eq :absent
    end

    it "is :mismatched if there is no module metadata" do
      allow(subject).to receive(:exist?).and_return true
      allow(metadata).to receive(:exist?).and_return false

      expect(subject.status).to eq :mismatched
    end

    it "is :mismatched if the metadata author doesn't match the expected author" do
      allow(subject).to receive(:exist?).and_return true

      allow(metadata).to receive(:author).and_return 'blargh'

      expect(subject.status).to eq :mismatched
    end

    it "is :outdated if the metadata version doesn't match the expected version" do
      allow(subject).to receive(:exist?).and_return true

      allow(metadata).to receive(:version).and_return R10K::SemVer.new('7.0.0')

      expect(subject.status).to eq :outdated
    end

    it "is :insync if the version and the author are in sync" do
      allow(subject).to receive(:exist?).and_return true

      expect(subject.status).to eq :insync
    end
  end

  describe "and the expected version is :latest", :vcr => true, :unless => (RUBY_VERSION == '1.8.7') do
    subject { described_class.new('branan/eight_hundred', '/moduledir', :latest) }

    let(:_metadata) do
      double('metadata',
             :version => R10K::SemVer.new('7.0.0'),
             :author => 'branan',
             :exist? => true,
             :read   => nil)
    end

    before do
      allow(R10K::Module::Metadata).to receive(:new).and_return _metadata
    end

    it "sets the expected version based on the latest forge version" do
      allow(subject).to receive(:exist?).and_return true
      expect(subject.status).to eq :outdated
      expect(subject.expected_version).to eq R10K::SemVer.new('8.0.0')
    end
  end
end
