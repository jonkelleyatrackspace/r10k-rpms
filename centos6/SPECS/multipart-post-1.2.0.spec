%global gem_name multipart-post

Name: rubygem-%{gem_name}
Version: 1.2.0
Release: 3%{?dist}
Summary: A multipart form post accessory for Net::HTTP
Group: Development/Languages
License: Internal
URL: https://github.com/nicksieger/multipart-post
Source0: %{gem_name}-%{version}.gem
Requires: ruby(abi) >= 1.8
Requires: ruby(rubygems) 
BuildRequires: ruby(abi) >= 1.8
BuildRequires: rubygems-devel 
BuildRequires: ruby 
BuildArch: noarch
Provides: rubygem(%{gem_name}) = %{version}

%description
Use with Net::HTTP to do multipart form posts.  IO values that have
#content_type, #original_filename, and #local_path will be posted as a binary
file.


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
%exclude %{gem_instdir}/Gemfile.lock
%exclude %{gem_instdir}/Rakefile
%exclude %{gem_instdir}/test
%{gem_spec}
%{gem_instdir}/multipart-post.gemspec

%files doc
%doc %{gem_docdir}
%doc %{gem_instdir}/History.txt
%doc %{gem_instdir}/Manifest.txt
%doc %{gem_instdir}/README.txt

%changelog
* Thu Sep 10 2015 James Stuart <software@jstuart.org> - 1.2.0-3
- Dependency update
* Tue Oct 21 2014  <rack@puppet-n01> - 1.2.0-1
- Initial package
