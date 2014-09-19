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
  s.files = ["bin/r10k"]
  s.homepage = "http://github.com/adrienthebo/r10k"
  s.licenses = ["Apache 2.0"]
  s.post_install_message = "NOTICE\n======\n\nIf you are upgrading from 1.1.0 and are using multiple sources, please read\nthis. (If not, feel free to continue with your regularly scheduled day.)\n\nGH-48 (https://github.com/adrienthebo/r10k/issues/48) introduced the ability\nfor environments to be prefixed with the source name so that multiple sources\ninstalled into the same directory would not overwrite each other. However\nprefixing was automatically enabled and would break existing setups where\nmultiple sources were cloned into different directories.\n\nBecause this introduced a breaking change, SemVer dictates that the automatic\nprefixing has to be rolled back. Prefixing can be enabled but always defaults\nto off. If you are relying on this behavior you will need to update your r10k.yaml\nto enable prefixing on a per-source basis.\n\nPlease see the issue (https://github.com/adrienthebo/r10k/issues/48) for more\ninformation.\n"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "Puppet environment and module deployment"

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
