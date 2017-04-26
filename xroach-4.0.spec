Summary: Displays disgusting cockroaches on your root X window
Name: xroach
Version: 1.5
Release: 4
Copyright: distributable
Group: X11/Amusements
Source: xroach-4.0.tar.gz
#Patch: (none)
%description
This program displays disgusting cockroaches on your root X window.
They scurry about when windows are minimized or moved.

%prep
%setup

%build
make RPM_OPT_FLAGS="$RPM_OPT_FLAGS"

%install
install -s -m 755 -o bin -g bin xroach /usr/X11R6/bin/xroach
install -m 644 -o bin -g bin xroach.1 /usr/X11/R6/man/man1/xroach.1x

%files
%doc README

/usr/X11R6/bin/xroach
/usr/X11/R6/man/man1/xroach.1x

