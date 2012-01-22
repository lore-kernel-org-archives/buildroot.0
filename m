From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 Jan 2012 23:48:36 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20120122224847.AECD490357@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c847b4a63993d48482a406471b5ebd89ee79453a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   46 ++++++++++++++++++++++++++++++----------------
 1 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/CHANGES b/CHANGES
index 19f6e7c..6b893cd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,35 +2,49 @@
 
 	Fixes all over the tree and new features.
 
-	Toolchain: Default to GCC 4.5.x, add binutils 2.22.
+	Toolchain: Default to GCC 4.5.x, add binutils 2.22. Java
+	support removed, Powerpc SPE ABI support.
 
 	Gentargets: scp and mercurial support.
+	Autotools: derrive host dependencies from target by default.
 
-	defconfigs: qemu configs for x86-64 and sparc.
+	defconfigs: qemu configs for x86-64, mips and sparc.
 
 	uClibc: remove 0.9.30, backport unshare() support, add
-	0.9.32.1.
+	0.9.32.1, use same config for ctng.
 
-	Bootloaders: U-Boot: add 2011.12, remove 2010.xx versions.
+	Bootloaders: U-Boot: add 2011.12, remove 2010.xx versions,
+	Barebox: add 2012.01, remove 2011.10.
 
 	Buildroot now calls the stop function of scripts in /etc/init.d at
 	shutdown.
 
-	Updated/fixed packages: barebox, bash, beecrypt, binutils,
-	bison, busybox, cdrkit, coreutils, dbus-glib, diffutils,
-	dropbear, ebtables, ethtool, ffmpeg, flex, fluxbox, gawk,
-	grep, gst-dsp, gst-ffmpeg, hostapd, htop, i2c-tools, iproute2,
-	ipset, iw, kismet, lame, libcap, libcgi, libeXosip2, libffi,
-	libgpg-error, libgtk2, libnl, libosip, libroxml, lighttpd, m4,
-	module-init-tools, mpd, mtd-utils, nano, nbd, netsnmp, opencv,
-	pcre, proftpd, ruby, samba, sqlite, squid, ti-utils, uboot,
-	uboot-tools, usbmount, valgrind, vsftpd, wpa_supplicant,
-	xapp_xman, xdm, xf86-video-sis
+	Updated/fixed packages: atk, barebox, bash, beecrypt, binutils,
+	bison, bluez_utils, busybox, cairo, ccache, cdrkit, coreutils,
+	cramfs, dbus-glib, dialog, diffutils, dropbear, e2fsprogs,
+	ebtables, ed, ethtool, ffmpeg, file, flex, fluxbox,
+	fontconfig, gawk, grep, gst-dsp, gst-ffmpeg, hostapd, htop,
+	i2c-tools, icu, iproute2, ipset, iptables, iw, kismet, lame,
+	libcap, libcgi, libeXosip2, libffi, libgpg-error, libgtk2,
+	libidn, libmnl, libnl, libosip, libpng, libroxml, libv4l,
+	libxcb, libxml-parser-perl, libxslt, lighttpd, links, m4,
+	module-init-tools, mpc, mpd, mpfr, mtd-utils, nano, nbd,
+	ncurses, netsnmp, opencv, openssl, openvpn, orc, pcre,
+	pkg-config, proftpd, python, ruby, samba, squashfs3, sshfs,
+	sqlite, squid, syslinux, ti-utils, tiff, uboot, uboot-tools,
+	usbmount, valgrind, vsftpd, wpa_supplicant,
+	xapp_{bdftopcf,mkfontdir,mkfontscale,xkbcomp,xcursorgen,xman},
+	xdm, xenomai, xf86-video-sis, xfont_{encodings,font-util},
+	xlib_lib{fontenc,X11,Xau,Xcursor,Xdmcp,Xfixes,Xfont,Xrender},
+	xlib_libxkbfile, xutil_makedepend
 
 	New packages: connman, explorercanvas, feh, flot, giblib,
 	igh-ethercat, imlib2, jquery, jquery-sparklines,
-	jquery-validation, jsmin, libesmtp, libmbus, NetworkManager,
-	rt-tests, transmission, xinput-calibrator
+	jquery-validation, jsmin, kmod, libesmtp, libmbus,
+	NetworkManager, open2300, python-distutilscross, python-dpkt,
+	python-netifaces, python-pygame, python-setuptools, rt-tests,
+	sane-backends, transmission, unionfs, xf86-input-tslib,
+	xinput-calibrator
 
 	Issues resolved (http://bugs.uclibc.org):
 
