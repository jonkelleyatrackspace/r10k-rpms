require 'spec_helper'
require 'r10k/git/cache'

describe R10K::Git::Cache do

  subject(:cache) { described_class.new('git://some/git/remote') }

  before do
    expect(cache).to receive(:execute).never
  end

  describe "updating the cache" do
    it "only updates the cache once" do
      expect(cache).to receive(:sync!).exactly(1).times
      cache.sync
      cache.sync
    end
  end


  describe "enumerating branches" do
    let(:refs) do
      %w[
        refs/heads/master
        refs/heads/next
        refs/heads/next-fetch-errors
        refs/heads/next-update-forge-modules
      ].map { |line| line + "\n" }.join
    end

    it "lists local branches using git for-each-ref" do
      expect(cache).to receive(:git).with(%w[for-each-ref refs/heads --format %(refname)], anything).and_return(double(:stdout => refs))

      expect(cache.branches).to eq %w[master next next-fetch-errors next-update-forge-modules]
    end
  end

end
