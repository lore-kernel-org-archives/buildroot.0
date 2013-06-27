From: Aleksandar Zivkovic <Aleksandar.Zivkovic@rt-rk.com>
Date: Thu, 27 Jun 2013 14:18:18 +0200
Subject: [Buildroot] legal-info manifest file contains duplicated packages
Message-ID: <kqhai4$sid$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear group,

If you check at Buildroot autobuilder legal-info manifest file (e.g. 
http://autobuild.buildroot.org/results/9e6/9e624f84404134623329bea03506e07822c1836d//licenses-manifest.csv) 
you can see that some packages are duplicated (e.g. dbus) duplicates are 
mostly at the end of the list.

Here is a list of duplicated packages I have detected in my build:
dbus-glib
dbus
freetype
libcap
libtool
icu
libgtk2
gdk-pixbuf
libglib2
libpng
expat
libffi
libxml2
libxslt
ncurses
xapp_xcursorgen
xapp_xkbcomp
xcb-proto
xlib_libfontenc
xlib_libX11
xlib_libXcursor
xlib_libxkbfile
xproto_xproto
xlib_libXfont


Regards,
Aleksandar Zivkovic
