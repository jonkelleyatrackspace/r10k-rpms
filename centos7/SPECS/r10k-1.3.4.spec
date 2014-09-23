# Generated from r10k-1.3.4.gem by gem2rpm -*- rpm-spec -*-
%global gem_name r10k

Name: rubygem-%{gem_name}
Version: 1.3.4
Release: 1%{?dist}
Summary: Puppet environment and module deployment
Group: Development/Languages
License: Internal
URL: http://github.com/adrienthebo/r10k
Source0: https://rubygems.org/gems/%{gem_name}-%{version}.gem
Requires: ruby(release)
Requires: ruby(rubygems) 
Requires: rubygem(colored) >= 1.2
Requires: rubygem(cri) => 2.5.0
Requires: rubygem(cri) < 2.6
Requires: rubygem(systemu) => 2.5.2
Requires: rubygem(systemu) < 2.6
Requires: rubygem(log4r) >= 1.1.10
Requires: rubygem(multi_json) => 1.8.2
Requires: rubygem(multi_json) < 1.9
Requires: rubygem(json_pure) => 1.8.1
Requires: rubygem(json_pure) < 1.9
Requires: rubygem(faraday) => 0.8.8
Requires: rubygem(faraday) < 0.9
Requires: rubygem(faraday_middleware) => 0.9.0
Requires: rubygem(faraday_middleware) < 0.10
Requires: rubygem(faraday_middleware-multi_json) => 0.0.5
Requires: rubygem(faraday_middleware-multi_json) < 0.1
BuildRequires: ruby(release)
BuildRequires: rubygems-devel 
BuildRequires: ruby 
# BuildRequires: rubygem(rspec) => 2.14.0
# BuildRequires: rubygem(rspec) < 2.15
# BuildRequires: rubygem(vcr) => 2.8.0
# BuildRequires: rubygem(vcr) < 2.9
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
%{gem_spec}

%files doc
%doc %{gem_docdir}

%changelog
* Fri Sep 19 2014 root - 1.3.4-1
- Initial package
