# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "r10k"
  s.version = "1.3.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Adrien Thebo"]
  s.date = "2014-09-15"
  s.description = "    R10K provides a general purpose toolset for deploying Puppet environments and modules.\n    It implements the Puppetfile format and provides a native implementation of Puppet\n    dynamic environments.\n"
  s.email = "adrien@somethingsinistral.net"
  s.executables = ["r10k"]
  s.files = [".gitignore", ".nodeset.yml", ".rspec", ".travis.yml", "CHANGELOG.mkd", "Gemfile", "LICENSE", "README.markdown", "Rakefile", "bin/r10k", "doc/dynamic-environments.mkd", "doc/dynamic-environments/configuration.mkd", "doc/dynamic-environments/git-environments.markdown", "doc/dynamic-environments/introduction.mkd", "doc/dynamic-environments/usage.mkd", "doc/puppetfile.markdown", "lib/r10k.rb", "lib/r10k/cli.rb", "lib/r10k/cli/deploy.rb", "lib/r10k/cli/environment.rb", "lib/r10k/cli/environment/deploy.rb", "lib/r10k/cli/environment/list.rb", "lib/r10k/cli/environment/stale.rb", "lib/r10k/cli/ext/logging.rb", "lib/r10k/cli/help.rb", "lib/r10k/cli/module.rb", "lib/r10k/cli/module/deploy.rb", "lib/r10k/cli/module/list.rb", "lib/r10k/cli/puppetfile.rb", "lib/r10k/cli/synchronize.rb", "lib/r10k/cli/version.rb", "lib/r10k/deployment.rb", "lib/r10k/deployment/basedir.rb", "lib/r10k/deployment/config.rb", "lib/r10k/deployment/config/loader.rb", "lib/r10k/deployment/environment.rb", "lib/r10k/deployment/source.rb", "lib/r10k/environment.rb", "lib/r10k/environment/base.rb", "lib/r10k/environment/git.rb", "lib/r10k/environment/svn.rb", "lib/r10k/errors.rb", "lib/r10k/execution.rb", "lib/r10k/git.rb", "lib/r10k/git/alternates.rb", "lib/r10k/git/cache.rb", "lib/r10k/git/commit.rb", "lib/r10k/git/errors.rb", "lib/r10k/git/head.rb", "lib/r10k/git/ref.rb", "lib/r10k/git/remote_head.rb", "lib/r10k/git/repository.rb", "lib/r10k/git/tag.rb", "lib/r10k/git/working_dir.rb", "lib/r10k/instance_cache.rb", "lib/r10k/keyed_factory.rb", "lib/r10k/logging.rb", "lib/r10k/module.rb", "lib/r10k/module/base.rb", "lib/r10k/module/forge.rb", "lib/r10k/module/git.rb", "lib/r10k/module/metadata.rb", "lib/r10k/module/svn.rb", "lib/r10k/module_repository.rb", "lib/r10k/module_repository/forge.rb", "lib/r10k/puppetfile.rb", "lib/r10k/registry.rb", "lib/r10k/semver.rb", "lib/r10k/settings.rb", "lib/r10k/settings/container.rb", "lib/r10k/settings/mixin.rb", "lib/r10k/source.rb", "lib/r10k/source/base.rb", "lib/r10k/source/git.rb", "lib/r10k/source/svn.rb", "lib/r10k/svn.rb", "lib/r10k/svn/remote.rb", "lib/r10k/svn/working_dir.rb", "lib/r10k/task.rb", "lib/r10k/task/deployment.rb", "lib/r10k/task/environment.rb", "lib/r10k/task/module.rb", "lib/r10k/task/puppetfile.rb", "lib/r10k/task_runner.rb", "lib/r10k/util/core_ext/hash_ext.rb", "lib/r10k/util/platform.rb", "lib/r10k/util/purgeable.rb", "lib/r10k/util/subprocess.rb", "lib/r10k/util/subprocess/io.rb", "lib/r10k/util/subprocess/posix.rb", "lib/r10k/util/subprocess/posix/io.rb", "lib/r10k/util/subprocess/posix/runner.rb", "lib/r10k/util/subprocess/result.rb", "lib/r10k/util/subprocess/runner.rb", "lib/r10k/util/subprocess/windows.rb", "lib/r10k/util/subprocess/windows/io.rb", "lib/r10k/util/subprocess/windows/runner.rb", "lib/r10k/version.rb", "r10k.gemspec", "r10k.yaml.example", "spec/fixtures/empty/.empty", "spec/fixtures/module/forge/eight_hundred/Modulefile", "spec/fixtures/module/forge/eight_hundred/metadata.json", "spec/fixtures/vcr/cassettes/R10K_ModuleRepository_Forge/and_the_expected_version_is_latest/can_fetch_all_versions_of_a_given_module.yml", "spec/fixtures/vcr/cassettes/R10K_ModuleRepository_Forge/and_the_expected_version_is_latest/can_fetch_the_latest_version_of_a_given_module.yml", "spec/fixtures/vcr/cassettes/R10K_ModuleRepository_Forge/looking_up_versions.yml", "spec/fixtures/vcr/cassettes/R10K_ModuleRepository_Forge/looking_up_versions/can_fetch_all_versions_of_a_given_module.yml", "spec/fixtures/vcr/cassettes/R10K_ModuleRepository_Forge/looking_up_versions/can_fetch_the_latest_version_of_a_given_module.yml", "spec/fixtures/vcr/cassettes/R10K_Module_Forge/and_the_expected_version_is_latest/sets_the_expected_version_based_on_the_latest_forge_version.yml", "spec/rspec-system-r10k/puppetfile.rb", "spec/rspec-system-r10k/tmpdir.rb", "spec/shared-examples/git-ref.rb", "spec/spec_helper.rb", "spec/system-provisioning/el.rb", "spec/system/module/forge/install_spec.rb", "spec/system/module/git/install_spec.rb", "spec/system/module/svn/install_spec.rb", "spec/system/module/svn/update_spec.rb", "spec/system/spec_helper.rb", "spec/system/system-helpers.rb", "spec/system/version_spec.rb", "spec/unit/deployment/environment_spec.rb", "spec/unit/deployment/source_spec.rb", "spec/unit/environment/git_spec.rb", "spec/unit/environment/svn_spec.rb", "spec/unit/git/alternates_spec.rb", "spec/unit/git/cache_spec.rb", "spec/unit/git/commit_spec.rb", "spec/unit/git/head_spec.rb", "spec/unit/git/ref_spec.rb", "spec/unit/git/repository_spec.rb", "spec/unit/git/tag_spec.rb", "spec/unit/git/working_dir_spec.rb", "spec/unit/instance_cache_spec.rb", "spec/unit/keyed_factory_spec.rb", "spec/unit/module/forge_spec.rb", "spec/unit/module/git_spec.rb", "spec/unit/module/metadata_spec.rb", "spec/unit/module/svn_spec.rb", "spec/unit/module_repository/forge_spec.rb", "spec/unit/module_spec.rb", "spec/unit/settings/container_spec.rb", "spec/unit/source/git_spec.rb", "spec/unit/source/svn_spec.rb", "spec/unit/source_spec.rb", "spec/unit/svn/remote_spec.rb", "spec/unit/util/core_ext/hash_ext_spec.rb", "spec/unit/util/subprocess_spec.rb"]
  s.homepage = "http://github.com/adrienthebo/r10k"
  s.licenses = ["Apache 2.0"]
  s.post_install_message = "NOTICE\n======\n\nIf you are upgrading from 1.1.0 and are using multiple sources, please read\nthis. (If not, feel free to continue with your regularly scheduled day.)\n\nGH-48 (https://github.com/adrienthebo/r10k/issues/48) introduced the ability\nfor environments to be prefixed with the source name so that multiple sources\ninstalled into the same directory would not overwrite each other. However\nprefixing was automatically enabled and would break existing setups where\nmultiple sources were cloned into different directories.\n\nBecause this introduced a breaking change, SemVer dictates that the automatic\nprefixing has to be rolled back. Prefixing can be enabled but always defaults\nto off. If you are relying on this behavior you will need to update your r10k.yaml\nto enable prefixing on a per-source basis.\n\nPlease see the issue (https://github.com/adrienthebo/r10k/issues/48) for more\ninformation.\n"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "Puppet environment and module deployment"
  s.test_files = ["spec/system/version_spec.rb", "spec/system/module/git/install_spec.rb", "spec/system/module/forge/install_spec.rb", "spec/system/module/svn/update_spec.rb", "spec/system/module/svn/install_spec.rb", "spec/unit/environment/svn_spec.rb", "spec/unit/environment/git_spec.rb", "spec/unit/module_spec.rb", "spec/unit/module_repository/forge_spec.rb", "spec/unit/git/ref_spec.rb", "spec/unit/git/working_dir_spec.rb", "spec/unit/git/cache_spec.rb", "spec/unit/git/commit_spec.rb", "spec/unit/git/repository_spec.rb", "spec/unit/git/head_spec.rb", "spec/unit/git/alternates_spec.rb", "spec/unit/git/tag_spec.rb", "spec/unit/keyed_factory_spec.rb", "spec/unit/deployment/environment_spec.rb", "spec/unit/deployment/source_spec.rb", "spec/unit/source_spec.rb", "spec/unit/util/subprocess_spec.rb", "spec/unit/util/core_ext/hash_ext_spec.rb", "spec/unit/instance_cache_spec.rb", "spec/unit/settings/container_spec.rb", "spec/unit/svn/remote_spec.rb", "spec/unit/source/svn_spec.rb", "spec/unit/source/git_spec.rb", "spec/unit/module/forge_spec.rb", "spec/unit/module/svn_spec.rb", "spec/unit/module/git_spec.rb", "spec/unit/module/metadata_spec.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<colored>, [">= 1.2"])
      s.add_runtime_dependency(%q<cri>, ["~> 2.5.0"])
      s.add_runtime_dependency(%q<systemu>, ["~> 2.5.2"])
      s.add_runtime_dependency(%q<log4r>, [">= 1.1.10"])
      s.add_runtime_dependency(%q<multi_json>, ["~> 1.8.2"])
      s.add_runtime_dependency(%q<json_pure>, ["~> 1.8.1"])
      s.add_runtime_dependency(%q<faraday>, ["~> 0.8.8"])
      s.add_runtime_dependency(%q<faraday_middleware>, ["~> 0.9.0"])
      s.add_runtime_dependency(%q<faraday_middleware-multi_json>, ["~> 0.0.5"])
      s.add_development_dependency(%q<rspec>, ["~> 2.14.0"])
      s.add_development_dependency(%q<vcr>, ["~> 2.8.0"])
      s.add_development_dependency(%q<yard>, ["~> 0.8.7.3"])
    else
      s.add_dependency(%q<colored>, [">= 1.2"])
      s.add_dependency(%q<cri>, ["~> 2.5.0"])
      s.add_dependency(%q<systemu>, ["~> 2.5.2"])
      s.add_dependency(%q<log4r>, [">= 1.1.10"])
      s.add_dependency(%q<multi_json>, ["~> 1.8.2"])
      s.add_dependency(%q<json_pure>, ["~> 1.8.1"])
      s.add_dependency(%q<faraday>, ["~> 0.8.8"])
      s.add_dependency(%q<faraday_middleware>, ["~> 0.9.0"])
      s.add_dependency(%q<faraday_middleware-multi_json>, ["~> 0.0.5"])
      s.add_dependency(%q<rspec>, ["~> 2.14.0"])
      s.add_dependency(%q<vcr>, ["~> 2.8.0"])
      s.add_dependency(%q<yard>, ["~> 0.8.7.3"])
    end
  else
    s.add_dependency(%q<colored>, [">= 1.2"])
    s.add_dependency(%q<cri>, ["~> 2.5.0"])
    s.add_dependency(%q<systemu>, ["~> 2.5.2"])
    s.add_dependency(%q<log4r>, [">= 1.1.10"])
    s.add_dependency(%q<multi_json>, ["~> 1.8.2"])
    s.add_dependency(%q<json_pure>, ["~> 1.8.1"])
    s.add_dependency(%q<faraday>, ["~> 0.8.8"])
    s.add_dependency(%q<faraday_middleware>, ["~> 0.9.0"])
    s.add_dependency(%q<faraday_middleware-multi_json>, ["~> 0.0.5"])
    s.add_dependency(%q<rspec>, ["~> 2.14.0"])
    s.add_dependency(%q<vcr>, ["~> 2.8.0"])
    s.add_dependency(%q<yard>, ["~> 0.8.7.3"])
  end
end

