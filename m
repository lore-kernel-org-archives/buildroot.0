From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 31 Jan 2012 13:48:44 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20120131124906.DAF6990967@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08f46cc60c97a49faa8289fc59ac7aa2e43aeb0a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   55 +++++++++++++++++++++++++++++++------------------------
 1 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6b893cd..b10fff8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,7 +3,8 @@
 	Fixes all over the tree and new features.
 
 	Toolchain: Default to GCC 4.5.x, add binutils 2.22. Java
-	support removed, Powerpc SPE ABI support.
+	support removed, Powerpc SPE ABI support. GDB ELF support fix,
+	GDB 7.4.
 
 	Gentargets: scp and mercurial support.
 	Autotools: derrive host dependencies from target by default.
@@ -19,31 +20,37 @@
 	Buildroot now calls the stop function of scripts in /etc/init.d at
 	shutdown.
 
-	Updated/fixed packages: atk, barebox, bash, beecrypt, binutils,
-	bison, bluez_utils, busybox, cairo, ccache, cdrkit, coreutils,
-	cramfs, dbus-glib, dialog, diffutils, dropbear, e2fsprogs,
-	ebtables, ed, ethtool, ffmpeg, file, flex, fluxbox,
-	fontconfig, gawk, grep, gst-dsp, gst-ffmpeg, hostapd, htop,
-	i2c-tools, icu, iproute2, ipset, iptables, iw, kismet, lame,
-	libcap, libcgi, libeXosip2, libffi, libgpg-error, libgtk2,
-	libidn, libmnl, libnl, libosip, libpng, libroxml, libv4l,
-	libxcb, libxml-parser-perl, libxslt, lighttpd, links, m4,
-	module-init-tools, mpc, mpd, mpfr, mtd-utils, nano, nbd,
-	ncurses, netsnmp, opencv, openssl, openvpn, orc, pcre,
-	pkg-config, proftpd, python, ruby, samba, squashfs3, sshfs,
-	sqlite, squid, syslinux, ti-utils, tiff, uboot, uboot-tools,
-	usbmount, valgrind, vsftpd, wpa_supplicant,
+	Updated/fixed packages: atk, avahi, barebox, bash, beecrypt,
+	bind, binutils, bison, bluez_utils, busybox, cairo, ccache,
+	cdrkit, coreutils, cramfs, dbus, dbus-glib, dialog, diffutils,
+	dmalloc, dropbear, e2fsprogs, ebtables, ed, ethtool, expat,
+	ffmpeg, file, flex, fluxbox, fontconfig, gawk, grep, gst-dsp,
+	gst-ffmpeg, gst-plugins-base, hdparm, hostapd, htop,
+	i2c-tools, icu, iproute2, ipset, iptables, iw, jpeg, kismet,
+	lame, libcap, libcgi, libeXosip2, libffi, libgpg-error,
+	libgtk2, libidn, libmms, libmnl, libnl, libogg, libosip,
+	libpcap, libpng, libraw1394, libroxml, libv4l, libxcb,
+	libxml-parser-perl, libxslt, lighttpd, links, lm-sensors, lua,
+	m4, module-init-tools, mpc, mpd, mpfr, mplayer, mtd-utils,
+	nano, nbd, ncurses, netperf, netsnmp, ntp, opencv, openssl,
+	openvpn, orc, pciutils, pcre, pkg-config, proftpd, python, qt,
+	ruby, samba, squashfs3, sshfs, sqlite, squid, sudo, syslinux,
+	tcl, tcpdump, ti-utils, tiff, tremor, uboot, uboot-tools,
+	usbmount, vala, valgrind, vsftpd, wpa_supplicant,
 	xapp_{bdftopcf,mkfontdir,mkfontscale,xkbcomp,xcursorgen,xman},
-	xdm, xenomai, xf86-video-sis, xfont_{encodings,font-util},
+	xcb-util, xdm, xenomai, xf86-video-sis,
+	xfont_{encodings,font-util},
 	xlib_lib{fontenc,X11,Xau,Xcursor,Xdmcp,Xfixes,Xfont,Xrender},
-	xlib_libxkbfile, xutil_makedepend
-
-	New packages: connman, explorercanvas, feh, flot, giblib,
-	igh-ethercat, imlib2, jquery, jquery-sparklines,
-	jquery-validation, jsmin, kmod, libesmtp, libmbus,
-	NetworkManager, open2300, python-distutilscross, python-dpkt,
-	python-netifaces, python-pygame, python-setuptools, rt-tests,
-	sane-backends, transmission, unionfs, xf86-input-tslib,
+	xlib_libxkbfile, xutil_makedepend, yajl
+
+	New packages: boost, connman, expedite, explorercanvas, feh,
+	flot, giblib, igh-ethercat, imlib2, jquery, jquery-sparklines,
+	jquery-validation, jsmin, kmod, libecore, libedbus, libedje,
+	libeet, libeina, libelementary, libesmtp, libethumb, libevas,
+	libical, libmbus, linux-firmware, NetworkManager, open2300,
+	python-distutilscross, python-dpkt, python-netifaces,
+	python-pygame, python-setuptools, rt-tests, sane-backends,
+	sqlcipher, transmission, unionfs, xf86-input-tslib,
 	xinput-calibrator
 
 	Issues resolved (http://bugs.uclibc.org):
