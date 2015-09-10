%global gem_name cri

Name: rubygem-%{gem_name}
Version: 2.6.1
Release: 1%{?dist}
Summary: a library for building easy-to-use commandline tools
Group: Development/Languages
License: Internal
URL: http://stoneship.org/software/cri/
Source0: %{gem_name}-%{version}.gem
Requires: ruby(abi) >= 1.8
Requires: ruby(rubygems) 
Requires: rubygem(colored) => 1.2
Requires: rubygem(colored) < 2
BuildRequires: ruby(abi) >= 1.8
BuildRequires: rubygems-devel 
BuildRequires: ruby 
BuildArch: noarch
Provides: rubygem(%{gem_name}) = %{version}

%description
Cri allows building easy-to-use commandline interfaces with support for
subcommands.


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
%exclude %{gem_instdir}/Rakefile
%exclude %{gem_instdir}/test
%exclude %{gem_instdir}/Gemfile.lock
%{gem_spec}
%{gem_instdir}/Gemfile
%{gem_instdir}/cri.gemspec

%files doc
%doc %{gem_docdir}
%doc %{gem_instdir}/LICENSE
%doc %{gem_instdir}/README.adoc
%doc %{gem_instdir}/NEWS.md

%changelog
* Thu Sep 10 2015 James Stuart <software@jstuart.org> - 2.6.1-1
- Version bump to 2.6.1
* Tue Oct 21 2014  <rack@puppet-n01> - 2.5.0-1
- Initial package