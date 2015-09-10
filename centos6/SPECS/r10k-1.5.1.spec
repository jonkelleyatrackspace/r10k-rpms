%global gem_name r10k

Name: rubygem-%{gem_name}
Version: 1.5.1
Release: 1%{?dist}
Summary: Puppet environment and module deployment
Group: Development/Languages
License: Internal
URL: http://github.com/adrienthebo/r10k
Source0: %{gem_name}-%{version}.gem
Requires: ruby(abi) >= 1.8
Requires: ruby(rubygems) 
Requires: rubygem(colored) = 1.2
Requires: rubygem(cri) => 2.6.1
Requires: rubygem(cri) < 2.7
Requires: rubygem(log4r) = 1.1.10
Requires: rubygem(multi_json) => 1.10
Requires: rubygem(multi_json) < 2
Requires: rubygem(json_pure) => 1.8
Requires: rubygem(json_pure) < 2
Requires: rubygem(faraday) => 0.9.0
Requires: rubygem(faraday) < 0.10
Requires: rubygem(faraday_middleware) => 0.9.0
Requires: rubygem(faraday_middleware) < 0.10
Requires: rubygem(faraday_middleware-multi_json) => 0.0.6
Requires: rubygem(faraday_middleware-multi_json) < 0.1
Requires: rubygem(semantic_puppet) => 0.1.0
Requires: rubygem(semantic_puppet) < 0.2
BuildRequires: ruby(abi) >= 1.8
BuildRequires: rubygems-devel 
BuildRequires: ruby 
# BuildRequires: rubygem(rspec) => 3.1
# BuildRequires: rubygem(rspec) < 4
# BuildRequires: rubygem(vcr) => 2.9
# BuildRequires: rubygem(vcr) < 3
# BuildRequires: rubygem(minitar) 
# BuildRequires: rubygem(yard) => 0.8.7.3
# BuildRequires: rubygem(yard) < 0.8.8
BuildArch: noarch
Provides: rubygem(%{gem_name}) = %{version}

%description
R10K provides a general purpose toolset for deploying Puppet environments
and modules.
It implements the Puppetfile format and provides a native implementation of
Puppet
dynamic environments.


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


mkdir -p %{buildroot}%{_bindir}
cp -a .%{_bindir}/* \
        %{buildroot}%{_bindir}/

find %{buildroot}%{gem_instdir}/bin -type f | xargs chmod a+x

# Run the test suite
%check
pushd .%{gem_instdir}

popd

%files
%dir %{gem_instdir}
%{_bindir}/r10k
%{gem_instdir}/bin
%{gem_libdir}
%exclude %{gem_cache}
%exclude %{gem_instdir}/.gitignore
%exclude %{gem_instdir}/.travis.yml
%exclude %{gem_instdir}/Gemfile
%exclude %{gem_instdir}/integration
%exclude %{gem_instdir}/spec
%{gem_spec}
%{gem_instdir}/r10k.gemspec
%{gem_instdir}/r10k.yaml.example

%files doc
%doc %{gem_docdir}
%doc %{gem_instdir}/CHANGELOG.mkd
%doc %{gem_instdir}/CONTRIBUTING.mkd
%doc %{gem_instdir}/LICENSE
%doc %{gem_instdir}/README.mkd
%doc %{gem_instdir}/doc

%changelog
* Thu Sep 10 2015 James Stuart <software@jstuart.org> - 1.5.1-1
- Version bump to 1.5.1
* Tue Oct 21 2014  <rack@puppet-n01> - 1.3.4-1
- Initial package
