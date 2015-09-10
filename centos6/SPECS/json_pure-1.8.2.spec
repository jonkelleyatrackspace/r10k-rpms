%global gem_name json_pure

# FIXME this includes binary extension source and
# Java code which is not being built

Name: rubygem-%{gem_name}
Version: 1.8.2
Release: 1%{?dist}
Summary: JSON Implementation for Ruby
Group: Development/Languages
License: Internal
URL: http://flori.github.com/json
Source0: %{gem_name}-%{version}.gem
Requires: ruby(abi) >= 1.8
Requires: ruby(rubygems) 
BuildRequires: ruby(abi) >= 1.8
BuildRequires: rubygems-devel 
BuildRequires: ruby 
# BuildRequires: rubygem(permutation) 
# BuildRequires: rubygem(sdoc) => 0.3.16
# BuildRequires: rubygem(sdoc) < 0.4
BuildArch: noarch
Provides: rubygem(%{gem_name}) = %{version}

%description
This is a JSON implementation in pure Ruby.


%package doc
Summary: Documentation for %{name}
Group: Documentation
Requires: %{name} = %{version}-%{release}
BuildArch: noarch

%description doc
Documentation for %{name}.

%prep
gem unpack %{SOURCE0}

%setup -q -D -T -n  %{gem_name}-%{version}

gem spec %{SOURCE0} -l --ruby > %{gem_name}.gemspec

%build
# Create the gem as gem install only works on a gem file
gem build %{gem_name}.gemspec

# %%gem_install compiles any C extensions and installs the gem into ./%%gem_dir
# by default, so that we can move it into the buildroot in %%install
%gem_install

%install
mkdir -p %{buildroot}%{gem_dir}
cp -a .%{gem_dir}/* \
        %{buildroot}%{gem_dir}/




# Run the test suite
%check
pushd .%{gem_instdir}

popd

%files
%dir %{gem_instdir}
%{gem_libdir}
%exclude %{gem_cache}
%exclude %{gem_instdir}/.gitignore
%exclude %{gem_instdir}/.travis.yml
%exclude %{gem_instdir}/Gemfile
%exclude %{gem_instdir}/Rakefile
%exclude %{gem_instdir}/diagrams
%exclude %{gem_instdir}/ext/json/ext
%exclude %{gem_instdir}/java
%exclude %{gem_instdir}/tests
%{gem_spec}
%{gem_instdir}/ext/json/extconf.rb
%{gem_instdir}/install.rb
%{gem_instdir}/json-java.gemspec
%{gem_instdir}/json.gemspec
%{gem_instdir}/json_pure.gemspec
%{gem_instdir}/tools

%files doc
%doc %{gem_docdir}
%doc %{gem_instdir}/CHANGES
%doc %{gem_instdir}/COPYING
%doc %{gem_instdir}/COPYING-json-jruby
%doc %{gem_instdir}/GPL
%doc %{gem_instdir}/README.rdoc
%doc %{gem_instdir}/README-json-jruby.markdown
%doc %{gem_instdir}/TODO
%doc %{gem_instdir}/VERSION
%doc %{gem_instdir}/data

%changelog
* Thu Sep 10 2015 James Stuart <software@jstuart.org> - 1.8.2-1
- Version bump to 1.8.2
- Note: this version does NOT include binary extension support
* Tue Oct 21 2014  <rack@puppet-n01> - 1.8.1-1
- Initial package
