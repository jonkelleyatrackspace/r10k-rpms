# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "log4r"
  s.version = "1.1.10"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Colby Gutierrez-Kraybill"]
  s.date = "2012-01-02"
  s.description = "See also: http://logging.apache.org/log4j"
  s.email = "colby@astro.berkeley.edu"
  s.files = ["doc/content/contact.html", "doc/content/contribute.html", "doc/content/index.html", "doc/content/license.html", "doc/content/manual.html", "doc/dev/checklist", "doc/dev/README.developers", "doc/dev/things-to-do", "doc/images/log4r-logo.png", "doc/images/logo2.png", "doc/log4r.css", "doc/rdoc-log4r.css", "doc/templates/main.html", "examples/ancestors.rb", "examples/chainsaw_settings.xml", "examples/customlevels.rb", "examples/filelog.rb", "examples/fileroll.rb", "examples/gmail.rb", "examples/gmail.yaml", "examples/log4r_yaml.yaml", "examples/logclient.rb", "examples/logserver.rb", "examples/moderate.xml", "examples/moderateconfig.rb", "examples/myformatter.rb", "examples/outofthebox.rb", "examples/rdoc-gen", "examples/README", "examples/rrconfig.xml", "examples/rrsetup.rb", "examples/simpleconfig.rb", "examples/syslogcustom.rb", "examples/xmlconfig.rb", "examples/yaml.rb", "lib/log4r/base.rb", "lib/log4r/config.rb", "lib/log4r/configurator.rb", "lib/log4r/formatter/formatter.rb", "lib/log4r/formatter/log4jxmlformatter.rb", "lib/log4r/formatter/patternformatter.rb", "lib/log4r/GDC.rb", "lib/log4r/lib/drbloader.rb", "lib/log4r/lib/xmlloader.rb", "lib/log4r/logevent.rb", "lib/log4r/logger.rb", "lib/log4r/loggerfactory.rb", "lib/log4r/logserver.rb", "lib/log4r/MDC.rb", "lib/log4r/NDC.rb", "lib/log4r/outputter/consoleoutputters.rb", "lib/log4r/outputter/datefileoutputter.rb", "lib/log4r/outputter/emailoutputter.rb", "lib/log4r/outputter/fileoutputter.rb", "lib/log4r/outputter/iooutputter.rb", "lib/log4r/outputter/outputter.rb", "lib/log4r/outputter/outputterfactory.rb", "lib/log4r/outputter/remoteoutputter.rb", "lib/log4r/outputter/rollingfileoutputter.rb", "lib/log4r/outputter/scribeoutputter.rb", "lib/log4r/outputter/staticoutputter.rb", "lib/log4r/outputter/syslogoutputter.rb", "lib/log4r/outputter/udpoutputter.rb", "lib/log4r/rdoc/configurator", "lib/log4r/rdoc/emailoutputter", "lib/log4r/rdoc/formatter", "lib/log4r/rdoc/GDC", "lib/log4r/rdoc/log4jxmlformatter", "lib/log4r/rdoc/log4r", "lib/log4r/rdoc/logger", "lib/log4r/rdoc/logserver", "lib/log4r/rdoc/MDC", "lib/log4r/rdoc/NDC", "lib/log4r/rdoc/outputter", "lib/log4r/rdoc/patternformatter", "lib/log4r/rdoc/scribeoutputter", "lib/log4r/rdoc/syslogoutputter", "lib/log4r/rdoc/win32eventoutputter", "lib/log4r/rdoc/yamlconfigurator", "lib/log4r/repository.rb", "lib/log4r/staticlogger.rb", "lib/log4r/version.rb", "lib/log4r/yamlconfigurator.rb", "lib/log4r.rb", "tests/README", "tests/test_helper.rb", "tests/testall.rb", "tests/testbase.rb", "tests/testchainsaw.rb", "tests/testconf.xml", "tests/testcustom.rb", "tests/testformatter.rb", "tests/testGDC.rb", "tests/testlogger.rb", "tests/testMDC.rb", "tests/testNDC.rb", "tests/testoutputter.rb", "tests/testpatternformatter.rb", "tests/testthreads.rb", "tests/testxmlconf.rb", "tests/testyaml.rb", "tests/testyaml_arrays.yaml", "tests/testyaml_injection.yaml"]
  s.homepage = "http://log4r.rubyforge.org"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "Log4r, logging framework for ruby"
  s.test_files = ["tests/README", "tests/test_helper.rb", "tests/testall.rb", "tests/testbase.rb", "tests/testchainsaw.rb", "tests/testconf.xml", "tests/testcustom.rb", "tests/testformatter.rb", "tests/testGDC.rb", "tests/testlogger.rb", "tests/testMDC.rb", "tests/testNDC.rb", "tests/testoutputter.rb", "tests/testpatternformatter.rb", "tests/testthreads.rb", "tests/testxmlconf.rb", "tests/testyaml.rb", "tests/testyaml_arrays.yaml", "tests/testyaml_injection.yaml"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<rake>, ["~> 0.8.7"])
    else
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<rake>, ["~> 0.8.7"])
    end
  else
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<rake>, ["~> 0.8.7"])
  end
end

