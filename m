From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 Feb 2014 22:29:44 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20140210213002.A407D9C956@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b5f44c2ed0ec3e3abaa62d8539cb5211ec32e9eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES |   59 +++++++++++++++++++++++++++++++++--------------------------
 1 files changed, 33 insertions(+), 26 deletions(-)

diff --git a/CHANGES b/CHANGES
index cece303..627f44a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -26,31 +26,33 @@
 	Python: package infrastructure, many new packages.
 
 	Defconfigs: Armadeus APF51 + Zedboard added, apf27, apf28,
-	microblaze, pandaboard, qemu, raspberry pi updated.
-
-	Updated/fixed packages: aiccu, alsa-lib, alsa-utils, aumix,
-	autoconf, automake, barebox, bellagio, berkeleydb, binutils,
-	bison, blackbox, bluez_utils, boost, bustle, busybox, cairo,
-	can-utils, ccache, ccid, cgilua, cifs-utils, civetweb, cmake,
-	collectd, connman, copas, coreutils, coxpcall, cppzmq, cramfs,
-	crda, cryptodev-linux, cryptsetup, cups, czmq, dhcpcd,
-	dhcpdump, dhrystone, dialog, dmraid, dnsmasq, dosfstools,
-	dropbear, dropwatch, dtc, duma, dvb-apps, e2fsprogs, eglibc,
-	eigen, elf2flt, erlang, ethtool, f2fs-tools, ffmpeg, file,
-	filemq, fio, flashrom, flex, fluxbox, fontconfig freerdp,
-	freetype, gadgetfs-test, gawk, gcc, gdb, gdbm, gettext, git,
-	glibc, gnupg, gnutls, gob2, gpsd, grep, grub, gst-ffmpeg,
-	gst-plugins-good, gst1-plugins-bad, gst1-plugins-base,
-	gst1-plugins-good, gst1-plugins-ugly, gstreamer, gstreamer1,
-	gtest, icu, iftop, imagemagick, inadyn, infozip, iozone,
-	iproute2, iptables, iw, jpeg, jq, kexec, kmod, knock, lbase64,
-	lcdapi, lftp, libcdaudio, libcgi, libcgicc, libcuefile,
-	libcurl, libdmtx, libdrm, libdvdnav, libdvdread, libegl,
-	libevent, libexif, libfcgi, libfreefare, libgles, libglib2,
-	libllcp, libmicrohttpd, libmpd, libnfc, libnl, libnss,
-	libopenmax, libopenvg, libpcap, libpfm4, libplayer, libpng,
-	libqmi, libreplaygain, libroxml, libsamplerate, libsexy,
-	libsigsegv, libsndfile, libsoc, libtasn1, libtpl, libupnp,
+	beaglebone, microblaze, pandaboard, qemu, raspberry pi
+	updated.
+
+	Updated/fixed packages: aiccu, alsa-lib, alsa-utils,
+	am33x-cm3, aumix, autoconf, automake, barebox, bellagio,
+	berkeleydb, binutils, bison, blackbox, bluez_utils, boost,
+	bustle, busybox, cairo, can-utils, ccache, ccid, cgilua,
+	cifs-utils, civetweb, cmake, collectd, connman, copas,
+	coreutils, coxpcall, cppzmq, cramfs, crda, cryptodev-linux,
+	cryptsetup, cups, czmq, dhcpcd, dhcpdump, dhrystone, dialog,
+	dmraid, dnsmasq, dosfstools, dropbear, dropwatch, dtc, duma,
+	dvb-apps, e2fsprogs, eglibc, eigen, elf2flt, erlang, ethtool,
+	f2fs-tools, ffmpeg, file, filemq, fio, flashrom, flex,
+	fluxbox, fontconfig freerdp, freetype, gadgetfs-test, gawk,
+	gcc, gdb, gdbm, gettext, git, glibc, gnupg, gnutls, gob2,
+	gpsd, grep, grub, gst-ffmpeg, gst-plugins-good,
+	gst1-plugins-bad, gst1-plugins-base, gst1-plugins-good,
+	gst1-plugins-ugly, gstreamer, gstreamer1, gtest, icu, iftop,
+	imagemagick, inadyn, infozip, iozone, iproute2, iptables, iw,
+	jpeg, jq, kexec, kmod, knock, lbase64, lcdapi, lftp,
+	libcdaudio, libcgi, libcgicc, libcuefile, libcurl, libdmtx,
+	libdrm, libdvdnav, libdvdread, libegl, libevent, libexif,
+	libfcgi, libfreefare, libgles, libglib2, libllcp,
+	libmicrohttpd, libmpd, libnfc, libnl, libnss, libopenmax,
+	libopenvg, libpcap, libpfm4, libplayer, libpng, libqmi,
+	libreplaygain, libroxml, libsamplerate, libsexy, libsigsegv,
+	libsndfile, libsoc, libtasn1, libtorrent, libtpl, libupnp,
 	libusb, libusb-compat, libvorbis, libxcb, libxml2, libxmlpp,
 	libyaml, lighttpd, linknx, linux-firmware, linux-pam, live555,
 	lm_sensors, lmbench, lockdev, logrotate, lrzsz, ltrace, lua,
@@ -106,15 +108,19 @@
 	rtmpdump, rtptools, smcroute, smstools3, tcpreplay, thrift,
 	ti-uim, tinyxml, tmux, vlc, wmctrl, xconsole
 
-	Removed packages: autoconf, automake, ccache, lzma,
+	Removed packages: autoconf, automake, ccache, cpanminus, lzma,
 	netkitbase, netkittelnet, pkg-config, squashfs3, ttcp, xstroke
 
 	Issues resolved (http://bugs.uclibc.org):
 
 	#65:   new package: dbus c++ language bindings
 	#769:  Update configuration menu for MIPS target
+	#2419: Add a bundle of Lua modules
 	#2629: Segmentation faults and division by zero in Grub on ext2
+	#3811: Added auto-mount for USB and SD Card (mdev) (for 2011.05)
+	#4339: Allow override of DL_DIR in extract step
 	#4363: Make sure that copied linux and busybox defconfig are...
+	#4454: There should be simple way to update image, when chang...
 	#5024: grub fails to build for x86_64 target architecture
 	#5066: New-Package: net-tools
 	#5072: ncurses: add ncurses-progs to target
@@ -131,6 +137,7 @@
 	#6434: apply-patches.sh does not work recursively
 	#6446: eglibc doesn't install ldconfig to target
 	#6484: Add c-ares
+	#6596: Slow bootup if mdev is chosen
 	#6656: Build Qt5 with ccache
 	#6662: internal compiler error: Segmentation fault during making..
 	#6722: Usage of $($(PKG)_DIR_PREFIX) is an issue with linux package
