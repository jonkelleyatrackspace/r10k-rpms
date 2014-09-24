# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{cri}
  s.version = "2.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Denis Defreyne"]
  s.date = %q{2014-03-01}
  s.description = %q{Cri allows building easy-to-use commandline interfaces with support for subcommands.}
  s.email = %q{denis.defreyne@stoneship.org}
  s.extra_rdoc_files = ["LICENSE", "README.adoc", "NEWS.md"]
  s.files = ["Gemfile", "Gemfile.lock", "LICENSE", "NEWS.md", "README.adoc", "Rakefile", "cri.gemspec", "lib/cri.rb", "lib/cri/argument_array.rb", "lib/cri/command.rb", "lib/cri/command_dsl.rb", "lib/cri/command_runner.rb", "lib/cri/commands/basic_help.rb", "lib/cri/commands/basic_root.rb", "lib/cri/core_ext.rb", "lib/cri/core_ext/string.rb", "lib/cri/help_renderer.rb", "lib/cri/option_parser.rb", "lib/cri/version.rb", "test/helper.rb", "test/test_argument_array.rb", "test/test_base.rb", "test/test_basic_help.rb", "test/test_basic_root.rb", "test/test_command.rb", "test/test_command_dsl.rb", "test/test_core_ext.rb", "test/test_option_parser.rb"]
  s.homepage = %q{http://stoneship.org/software/cri/}
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.adoc"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{a library for building easy-to-use commandline tools}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<colored>, ["~> 1.2"])
      s.add_development_dependency(%q<rake>, ["~> 10.1"])
      s.add_development_dependency(%q<minitest>, ["~> 5.3"])
      s.add_development_dependency(%q<yard>, ["~> 0.8"])
    else
      s.add_dependency(%q<colored>, ["~> 1.2"])
      s.add_dependency(%q<rake>, ["~> 10.1"])
      s.add_dependency(%q<minitest>, ["~> 5.3"])
      s.add_dependency(%q<yard>, ["~> 0.8"])
    end
  else
    s.add_dependency(%q<colored>, ["~> 1.2"])
    s.add_dependency(%q<rake>, ["~> 10.1"])
    s.add_dependency(%q<minitest>, ["~> 5.3"])
    s.add_dependency(%q<yard>, ["~> 0.8"])
  end
end

