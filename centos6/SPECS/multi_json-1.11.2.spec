%global gem_name multi_json

Name: rubygem-%{gem_name}
Version: 1.11.2
Release: 1%{?dist}
Summary: A common interface to multiple JSON libraries
Group: Development/Languages
License: Internal
URL: http://github.com/intridea/multi_json
Source0: %{gem_name}-%{version}.gem
Requires: ruby(abi) >= 1.8
Requires: ruby(rubygems) >= 1.3.5
BuildRequires: ruby(abi) >= 1.8
BuildRequires: rubygems-devel >= 1.3.5
BuildRequires: ruby 
BuildArch: noarch
Provides: rubygem(%{gem_name}) = %{version}

%description
A common interface to multiple JSON libraries, including Oj, Yajl, the JSON
gem (with C-extensions), the pure-Ruby JSON gem, NSJSONSerialization, gson.rb,
JrJackson, and OkJson.


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
%{gem_spec}
%{gem_instdir}/multi_json.gemspec

%files doc
%doc %{gem_docdir}
%doc %{gem_instdir}/CHANGELOG.md
%doc %{gem_instdir}/CONTRIBUTING.md
%doc %{gem_instdir}/LICENSE.md
%doc %{gem_instdir}/README.md

%changelog
* Thu Sep 10 2015 James Stuart <software@jstuart.org> - 1.11.2-1
- Version bump to 1.11.2
* Tue Oct 21 2014  <rack@puppet-n01> - 1.8.4-1
- Initial package
