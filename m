From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 8 May 2013 13:21:16 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20130508112314.3FDC499ED6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa3463d64bd43895a8e9eec80d80dcc3e904c665
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And also fixup tabs/spaces mix as pointed out by Thomas.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   37 +++++++++++++++++++------------------
 1 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/CHANGES b/CHANGES
index ba91242..6d1c21f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,11 +1,12 @@
 2013.05, Not released yet:
 
-        Architectures: ARC support, Blackfin support, FLAT binary
-        format, ARM: Drop old CPU variants, add fa526/626, Marvell PJ4
+	Architectures: ARC support, Blackfin support, FLAT binary
+	format, ARM: Drop old CPU variants, add fa526/626, Marvell PJ4
 
 	Toolchains: Add new Microblaze external toolchains, Linaro
 	ARM/Aarch64 updates, GCC 4.6.4 / 4.7.3 / 4.8.0 added to
-	internal toolchain, default to GCC 4.7.x.
+	internal toolchain, default to GCC 4.7.x. Internal
+	Crosstool-ng backend deprecated.
 
 	Defconfigs: Add Atmel at91sam9g45m10ek, freescale mpc8315erdb
 	& p1010rdb, Armadeus apf27 / apf28, Raspberry pi, gnublin
@@ -37,7 +38,7 @@
 	directfb-examples, divine, dmalloc, dnsmasq, dosfstools,
 	dropbear, e2fsprogs, ebtables, eeprog, erlang, ethtool, fbset,
 	feh, ffmpeg, file, flex, flot, foomatic, gd, gdb, gdisk,
-	genimage, gettext, gmp, gnuchess, gnutls, gob2, gpsd,
+	genimage, gettext, gmp, gnuchess, gnutls, gob2, gperf, gpsd,
 	gstreamer, haserl, hiawatha, htop, httping, icu,
 	inotify-tools, intltool, iproute2, ipset, iptables, iw, jpeg,
 	jquery, jquery-{sparkline,validation}, json-c, kbd, kexec,
@@ -50,11 +51,11 @@
 	ltp-testsuite, luajit, lzop, madplay, make, mdadm,
 	mediastreamer, memtester, mesa3d,
 	mobile-broadband-provider-info, monit, mpd, mpfr, mpg123,
-	mrouted, nbd, ncurses, ndisc6, neard, neardal, neon, netperf,
-	netsnmp, nettle, nfacct, ntfs-3g, ofono, olsr,
+	mrouted, msmtp, nbd, ncurses, ndisc6, neard, neardal, neon,
+	netperf, netsnmp, nettle, nfacct, ntfs-3g, ofono, olsr,
 	omap-u-boot-utils, openssh, openssl, openswan, openvpn,
-	oprofile, orc, pciutils, pcre, perl, php, poco, polarssl,
-	proftpd, psmisc, pulseaudio, python,
+	oprofile, orc, patch, pciutils, pcre, perl, php, poco,
+	polarssl, proftpd, psmisc, pulseaudio, python,
 	python-{bottle,netifaces,serial,setuptools}, qt, quagga,
 	quota, radvd, rpi-userland, rt-tests, sam-ba, samba, sawman,
 	sdl, ser2net, smartmontools, socat, socketcand, speex, squid,
@@ -79,16 +80,16 @@
 	xproto_{resource,scrnsaver,xcmisc,xext,x}proto,
 	xserver_xorg-server, xutil_makedepend, xz, zeromq
 
-	New packages: aircrack-ng, bcusdk, crda, cryptodev-linux,
-	cppzmq, czmq, dtach, enscript, exfat, exfat-utils, f2fs-tools,
-	fan-ctrl, filemq, foomatic-filters, genimage, genpart, glibmm,
-	gnuplot, gtest, gutenprint, hplip, iozone, jansson, jhead,
-	jquery-keyboard, jquery-ui, jquery-ui-themes, json-glib,
-	json-javascript, lcms2, libpfm4, libpthsem, libserial,
-	libsigsegv, libtasn1, libwebsockets, libxkbcommon, libxml++,
-	linknx, log4cxx, mongoose, mongrel2, mtools, ne10, nmap,
-	nodejs, openobex, openpgm, poppler, protobuf-c,
-	python-m2crypto, python-thrift, qjson, qt5base,
+	New packages: aircrack-ng, bcusdk, chrony, crda,
+	cryptodev-linux, cppzmq, czmq, dtach, enscript, exfat,
+	exfat-utils, f2fs-tools, fan-ctrl, filemq, foomatic-filters,
+	genimage, genpart, glibmm, gnuplot, gtest, gutenprint, hplip,
+	iozone, jansson, jhead, jquery-keyboard, jquery-ui,
+	jquery-ui-themes, json-glib, json-javascript, lcms2, libpfm4,
+	libpthsem, libserial, libsigsegv, libtasn1, libwebsockets,
+	libxkbcommon, libxml++, linknx, log4cxx, mongoose, mongrel2,
+	mtools, ne10, nmap, nodejs, openobex, openpgm, poppler,
+	protobuf-c, python-m2crypto, python-thrift, qjson, qt5base,
 	qt5declarative, qt5graphicaleffects, qt5imageformats,
 	qt5jsbackend, qt5multimedia, qt5quick1, qt5script, qt5svg,
 	qt5webkit qt5xmlpatterns, rapidjson, redis, swig, texinfo,
