# Generated from log4r-1.1.10.gem by gem2rpm -*- rpm-spec -*-
%global gem_name log4r
%define _unpackaged_files_terminate_build 0 
%define _missing_doc_files_terminate_build 0

Name: rubygem-%{gem_name}
Version: 1.1.10
Release: 1%{?dist}
Summary: Log4r, logging framework for ruby
Group: Development/Languages
License: Internal
URL: http://log4r.rubyforge.org
Source0: http://rubygems.org/gems/%{gem_name}-%{version}.gem
Requires: ruby(abi) = 1.8
Requires: ruby(rubygems) 
Requires: ruby(abi) = 1.8
BuildRequires: rubygems-devel 
BuildRequires: ruby 
BuildArch: noarch
Provides: rubygem(%{gem_name}) = %{version}

%description
See also: http://logging.apache.org/log4j.


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

%files doc
%doc %{gem_docdir}

%changelog
* Tue Oct 21 2014  <rack@puppet-n01> - 1.1.10-1
- Initial package
