# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "faraday_middleware-multi_json"
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dennis Rogenius"]
  s.date = "2014-05-13"
  s.description = "Faraday response parser using MultiJson"
  s.email = ["denro03@gmail.com"]
  s.homepage = "https://www.github.com/denro/faraday_middleware-multi_json"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "Response JSON parser using MultiJson and FaradayMiddleware"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<faraday_middleware>, [">= 0"])
      s.add_runtime_dependency(%q<multi_json>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<faraday_middleware>, [">= 0"])
      s.add_dependency(%q<multi_json>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<faraday_middleware>, [">= 0"])
    s.add_dependency(%q<multi_json>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
