From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:28:05 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20121114214721.1471399FD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d36fcceb07635fb46425122ad691cca0be252564
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   65 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 65 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index ae5f75d..f5d4cdf 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,5 +1,70 @@
 2012.11, Not released yet:
 
+	Fixes all over the tree and new features.
+
+	Defconfigs: use u-boot 2012.10 on at91 and beaglebone,
+	sheevaplug + qemu: bump kernel version, add qemu-mips64-malta
+	+ nitrogen6x defconfigs.
+
+	Bootloaders: add u-boot 2012.07/10, ais target format, add
+	barebox 2012.08/09/10, linker overlap issue fix for
+	at91bootstrap.
+
+	Toolchains: binutils 2.23, gcc 4.72, default to gcc 4.6.x,
+	Codebench arm/sh/x86 2012.03/09, Linaro 2012.08/09/10.
+	Libtirpc support for modern glibc variants.
+
+	Initial Aarch64 support.
+
+	Infrastructure: Use shallow git clone when possible, use
+	tarballs rather than git URLs for github. Moved to pkgconf
+	rather than pkg-config. System directory added, default
+	skeleton/device tables moved.
+
+	Updated/fixed packages: acpid, alsa-lib, alsamixergui,
+	automake, bind, binutils, bison, blackbox, busybox, cairo,
+	cifs-utils, cjson, cmake, collectd, connman, conntrack-tools,
+	coreutils, cups, cvs, dbus, dhcp, directfb, dnsmasq,
+	e2fsprogs, ethtool, fbdump, feh, fftw, flashrom, fluxbox, gdb,
+	gdisk, gdk-pixbuf, genext2fs, gettext, gnutls, gpsd, gqview,
+	grep, gst-plugins-{bad,good}, hdparm, hiawatha, hostapd,
+	input-tools, iproute2, ipset, iptables, iw, json-c, kmod,
+	lcdproc, leafpad, less, libcurl, libdrm, libdvdnav,
+	libdvdread, libfuse, libglib2, libhid, libmad, libmbus,
+	libmnl, libnetfilter_{acct,conntrack,cthelper,cttimeout,queue},
+	libnfnetlink, libnl, libnspr, libnss, libpcap, libplayer,
+	libtorrent, liburcu, libv4l, libxcb, libxml2, libxslt, links,
+	linux-firmware, lm-sensors, lmbench, lshw, lttng-babeltrace,
+	lttng-tools, luajit, mesa3d, microperl, mpc, mpd, mpg123,
+	mplayer, mtd-utils, mysql_client, nbd, netatalk, netkitbase,
+	netkittelnet, netsnmp, newt, nfs-utils, openssh, openssl,
+	opkg, patch, pcre, php, poco, portmap, pppd, pulseaudio,
+	python-protobuf, qt, quota, rp-pppoe, rtorrent, sam-ba, samba,
+	scons, sdl_gfx, smartmontools, sqlite, squid, strace, sudo,
+	sylpheed, ttcp, tiff, unionfs, usb_modeswitch, vala, vpnc,
+	vsftpd, webkit, wget, wpa_supplicant, x11vnc, xapp_*,
+	xdriver_*, xenomai, xfont_*, xinetd, xl2tp, xlib_*, xlsclient,
+	xproto_*, xserver_xorg-server, xutil_util-macros, xz, zeromq
+
+	New packages: arptables, at91bootstrap3, boot-wrapper-aarch64,
+	ccid, cpanminus, cpuload, erlang, evtest, fb-test-apps,
+	fxload, gdbm, gnupg, googlefontdirectory, grantlee, gsl,
+	lcdapi, liblo, liblog4c-localtime, libtirpc, linux-pam,
+	macchanger, mtdev, mtdev2tuio, nfacct, opus, opus-tools,
+	pcsc-lite, perl, pkgconf, python-meld3, python3, qemu,
+	qextserialport, qtuio, rpcbind, schifra, sconeserver,
+	supervisor, time, ulogd, usb_modeswitch_data, yasm
+
+	Deprecated packages: netkitbase, netkittelnet
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#807:  [PATCH] samba - make iconv and smbd optional
+	#3049: binutils have a sysroot bug in ld
+	#5330: update vsftpd to 3.0.0
+	#5486: libglib2 build fails on: libs/libglib-2.0.so: undefined...
+	#5666: Fails to build python 2.7.2 for 2440 arm
+
 2012.08, Release August 31th, 2012
 
 	Updated/fixed packages: microperl, cups, luajit, rrdtool,
