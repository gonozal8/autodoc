Name: autodoc
Version: %{VERSION}
Release: %{?RELEASE}%{!?RELEASE:1}
BuildArch: noarch
Summary: Automated generation of host documentation
Group: Applications/System

URL: https://github.com/gonozal8/autodoc
License: GPL

%description
Autodoc will automatically collect all available information about the local host including hardware, software, runtime information and configuration.
Data can be stored in a local directory, a reachable network path or uploaded to an archive server via HTTP(S).

%files
%doc /usr/share/doc/autodoc/README.md
%doc /usr/share/doc/autodoc/autodoc.tpl
/usr/bin/autodoc
