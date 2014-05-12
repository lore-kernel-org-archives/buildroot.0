From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 May 2014 00:03:26 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20140512220744.BC7E49CBAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4ee7714460fe5f7821371baef8f6dff1f37fbef1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And move the xbmc packages to the new packages list, as that's what they
are.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES |   62 +++++++++++++++++++++++++++++++-------------------------------
 1 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/CHANGES b/CHANGES
index b2106c3..d4fe2aa 100644
--- a/CHANGES
+++ b/CHANGES
@@ -38,16 +38,16 @@
 	Perl and virtual package infrastructure support added.
 	PRE_*_HOOKS support for all build steps.
 
-	Updated/fixed packages: acpid, agentpp, apr, avahi, barebox,
-	bash, beecrypt, bellagio, binutils, boost,
+	Updated/fixed packages: acpid, agentpp, aiccu, apr, avahi,
+	barebox, bash, beecrypt, bellagio, binutils, boost,
 	boot-wrapper-aarch64, bustle, busybox, ca-certificates, cairo,
 	ccache, ccid, cgilua, chrony, cifs-utils, civetweb, cmake,
 	collectd, connman, coreutils, coxpcall, cppcms, cppzmq, crda,
 	cryptodev, cryptsetup, cups, czmq, dbus, dhcpdump, directfb,
 	dmalloc, dmraid, dnsmasq, dosfstools, dsp-tools, dtc,
-	dvb-apps, ecryptfs-utils, eigen, erlang, ethtool, evemu,
-	evtest, f2fs-tools, fdk-aac, feh, ffmpeg, file, filemq, flac,
-	flot, fmtools, fping, freetype, fswebcam, gcc, gd, gdb,
+	dvb-apps, ebtables, ecryptfs-utils, eigen, erlang, ethtool,
+	evemu, evtest, f2fs-tools, fdk-aac, feh, ffmpeg, file, filemq,
+	flac, flot, fmtools, fping, freetype, fswebcam, gcc, gd, gdb,
 	gettext, giblib, git, glibc, glibmm, glib-networking, gmp,
 	gnutls, gpm, gpsd, gpu-viv-bin-mx6q, grep, gst1-libav,
 	gst1-plugins-bad, gst1-plugins-base, gst1-plugins-good,
@@ -59,9 +59,9 @@
 	jquery-keyboard, jquery-ui, jquery-ui-themes, json-glib,
 	json-javascript, kexec, kmod, lame, lbase64, lbreakout2,
 	lcdproc, lftp, libao, libatasmart, libatomic_ops, libcap,
-	libcdio, libcec, libcgicc, libcurl, libdrm, libdvdnav,
-	libdvdread, libegl, libeio, libenca, libesmtp, libevas,
-	libevdev, libfribidi, libfslcodec, libfslparser,
+	libcdio, libcec, libcgicc, libcgroup, libcurl, libdrm,
+	libdvdnav, libdvdread, libegl, libeio, libenca, libesmtp,
+	libevas, libevdev, libfribidi, libfslcodec, libfslparser,
 	libfslvpuwrap, libgail, libgles, libglib2, libgtk2, libhid,
 	libjpeg, libmbim, libmicrohttpd, libmodplug, libnftnl,
 	libnspr, libogg, libopenmax, libopenvg, libpcap, libplayer,
@@ -98,7 +98,7 @@
 	sdl_image, sdl_mixer, sg3_utils, slang, smstools3, snmppp,
 	socat, speex, sqlcipher, sqlite, squashfs, squid, strongswan,
 	stunnel, sunxi-boards, sunxi-mali, sunxi-tools, sylpheed,
-	syslinux, systemd, taglib, tcl, tcllib, tcpreplay,
+	syslinux, sysstat, systemd, taglib, tcl, tcllib, tcpreplay,
 	tidsp-binaries, ti-gfx, tmux, tvheadend, tzdata, uboot,
 	uboot-tools, uclibc, udev, udisks, ulogd, usb_modeswitch,
 	usb_modeswitch_data, usbmount, util-linux, valgrind, vlc,
@@ -115,27 +115,26 @@
 	xapp_xman, xapp_xmessage, xapp_xmodmap, xapp_xprop,
 	xapp_xrandr, xapp_xrdb, xapp_xrefresh, xapp_xset,
 	xapp_xsetroot, xapp_xsm, xapp_xstdcmap, xapp_xvidtune,
-	xapp_xvinfo, xapp_xwd, xapp_xwininfo, xbmc, xbmc-addon-xvdr,
-	xbmc-pvr-addons, xcb-util-wm, xdriver_xf86-input-evdev,
-	xdriver_xf86-input-joystick, xdriver_xf86-input-keyboard,
-	xdriver_xf86-input-mouse, xdriver_xf86-input-synaptics,
-	xdriver_xf86-input-vmmouse, xdriver_xf86-video-ark,
-	xdriver_xf86-video-ast, xdriver_xf86-video-ati,
-	xdriver_xf86-video-cirrus, xdriver_xf86-video-dummy,
-	xdriver_xf86-video-fbdev, xdriver_xf86-video-geode,
-	xdriver_xf86-video-glide, xdriver_xf86-video-glint,
-	xdriver_xf86-video-i128, xdriver_xf86-video-intel,
-	xdriver_xf86-video-mach64, xdriver_xf86-video-mga,
-	xdriver_xf86-video-neomagic, xdriver_xf86-video-newport,
-	xdriver_xf86-video-nv, xdriver_xf86-video-openchrome,
-	xdriver_xf86-video-r128, xdriver_xf86-video-savage,
-	xdriver_xf86-video-siliconmotion, xdriver_xf86-video-sis,
-	xdriver_xf86-video-tdfx, xdriver_xf86-video-tga,
-	xdriver_xf86-video-trident, xdriver_xf86-video-vesa,
-	xdriver_xf86-video-vmware, xdriver_xf86-video-voodoo, xenomai,
-	xerces, xl2tp, xlib_libFS, xlib_xtrans, xproto_xproto,
-	xserver_xorg-server, xutil_util-macros, zeromq, zic, zmqpp,
-	zyre
+	xapp_xvinfo, xapp_xwd, xapp_xwininfo, xcb-util-wm,
+	xdriver_xf86-input-evdev, xdriver_xf86-input-joystick,
+	xdriver_xf86-input-keyboard, xdriver_xf86-input-mouse,
+	xdriver_xf86-input-synaptics, xdriver_xf86-input-vmmouse,
+	xdriver_xf86-video-ark, xdriver_xf86-video-ast,
+	xdriver_xf86-video-ati, xdriver_xf86-video-cirrus,
+	xdriver_xf86-video-dummy, xdriver_xf86-video-fbdev,
+	xdriver_xf86-video-geode, xdriver_xf86-video-glide,
+	xdriver_xf86-video-glint, xdriver_xf86-video-i128,
+	xdriver_xf86-video-intel, xdriver_xf86-video-mach64,
+	xdriver_xf86-video-mga, xdriver_xf86-video-neomagic,
+	xdriver_xf86-video-newport, xdriver_xf86-video-nv,
+	xdriver_xf86-video-openchrome, xdriver_xf86-video-r128,
+	xdriver_xf86-video-savage, xdriver_xf86-video-siliconmotion,
+	xdriver_xf86-video-sis, xdriver_xf86-video-tdfx,
+	xdriver_xf86-video-tga, xdriver_xf86-video-trident,
+	xdriver_xf86-video-vesa, xdriver_xf86-video-vmware,
+	xdriver_xf86-video-voodoo, xenomai, xerces, xl2tp, xlib_libFS,
+	xlib_xtrans, xproto_xproto, xserver_xorg-server,
+	xutil_util-macros, zeromq, zic, zmqpp, zyre
 
 	New packages: armadillo, btrfs-progs, clapack, cosmo, dado,
 	dbus-triggerd, dtv-scan-tables, e2tools, eudev, exim, expect,
@@ -149,7 +148,8 @@
 	perl-module-build, php-gnupg, php-imagick, php-ssh2, php-yaml,
 	php-zmq, postgresql, python-libconfig, python-pypcap,
 	python-pyrex, qdecoder, qhull, samba4, smack, tz, tzdump, ucl,
-	upx, vo-aacenc, yaffs2utils, zlog, znc
+	upx, vo-aacenc, xbmc, xbmc-addon-xvdr, xbmc-pvr-addons,
+	yaffs2utils, zlog, znc
 
 	Removed packages: crosstool-ng, python-distutilscross, vala
 
