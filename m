From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 8 May 2013 15:49:08 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20130508135430.CAF5699FB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7f4923e8efa047433fdda563b3bb7af8f17a9d5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   40 ++++++++++++++++++++--------------------
 1 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6d1c21f..1b35017 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,8 +9,8 @@
 	Crosstool-ng backend deprecated.
 
 	Defconfigs: Add Atmel at91sam9g45m10ek, freescale mpc8315erdb
-	& p1010rdb, Armadeus apf27 / apf28, Raspberry pi, gnublin
-	board.
+	& p1010rdb, Armadeus apf27 / apf28, Openblocks A6, Raspberry
+	pi, gnublin board.
 
 	FS: LZO and XZ compression methods, extra ubifs options,
 	ext2 rev 0/1 and ext3/4 support.
@@ -36,19 +36,19 @@
 	busybox, ccache, cifs-utils, cmake, collectd, connman,
 	conntrack-tools, cpanminus, crosstool-ng, diffutils, directfb,
 	directfb-examples, divine, dmalloc, dnsmasq, dosfstools,
-	dropbear, e2fsprogs, ebtables, eeprog, erlang, ethtool, fbset,
-	feh, ffmpeg, file, flex, flot, foomatic, gd, gdb, gdisk,
-	genimage, gettext, gmp, gnuchess, gnutls, gob2, gperf, gpsd,
-	gstreamer, haserl, hiawatha, htop, httping, icu,
-	inotify-tools, intltool, iproute2, ipset, iptables, iw, jpeg,
-	jquery, jquery-{sparkline,validation}, json-c, kbd, kexec,
-	kismet, kmod, lcdproc, libarchive, libcap, libconfig,
-	libconfuse, libcurl, libdrm, libeet, libev, libevas,
-	libeXosip2, libffi, libfribi, libfuse, libgcrypt, libglib2,
-	libgtk2, libid3tag, libmicrohttpd, libnetfilter_acct,
-	libnetfilter_conntrack, libnl, libpcap, libplayer, libsigc,
-	libv4l, libxcb, linenoise, linux-pam, lm_sensors,
-	ltp-testsuite, luajit, lzop, madplay, make, mdadm,
+	dropbear, e2fsprogs, ebtables, eeprog, erlang, ethtool,
+	fb-test-app, fbset, feh, ffmpeg, file, flex, flot, foomatic,
+	fxload, gd, gdb, gdisk, genimage, gettext, gmp, gnuchess,
+	gnutls, gob2, gperf, gpsd, gstreamer, haserl, hiawatha, htop,
+	httping, icu, inotify-tools, intltool, iproute2, ipset,
+	iptables, iw, jpeg, jquery, jquery-{sparkline,validation},
+	json-c, kbd, kexec, kismet, kmod, lcdproc, libarchive,
+	libatasmart, libcap, libconfig, libconfuse, libcurl, libdrm,
+	libeet, libev, libevas, libeXosip2, libffi, libfribi, libfuse,
+	libgcrypt, libglib2, libgtk2, libid3tag, libmicrohttpd,
+	libnetfilter_acct, libnetfilter_conntrack, libnl, libpcap,
+	libplayer, libsigc, libv4l, libxcb, linenoise, linux-pam,
+	lm_sensors, ltp-testsuite, luajit, lzop, madplay, make, mdadm,
 	mediastreamer, memtester, mesa3d,
 	mobile-broadband-provider-info, monit, mpd, mpfr, mpg123,
 	mrouted, msmtp, nbd, ncurses, ndisc6, neard, neardal, neon,
@@ -57,11 +57,11 @@
 	oprofile, orc, patch, pciutils, pcre, perl, php, poco,
 	polarssl, proftpd, psmisc, pulseaudio, python,
 	python-{bottle,netifaces,serial,setuptools}, qt, quagga,
-	quota, radvd, rpi-userland, rt-tests, sam-ba, samba, sawman,
-	sdl, ser2net, smartmontools, socat, socketcand, speex, squid,
-	stress, stunnel, sudo, syslinux, sysstat, sysvinit, tcl,
-	tcprelay, tinyhttpd, tslib, tvheadend, uboot-tools, ulogd,
-	util-linux, vala, vtun, webkit,
+	quota, radvd, rpi-firmware, rpi-userland, rt-tests, sam-ba,
+	samba, sawman, sdl, ser2net, smartmontools, socat, socketcand,
+	speex, squid, stress, stunnel, sudo, syslinux, sysstat,
+	sysvinit, tcl, tcprelay, tinyhttpd, tslib, tvheadend,
+	uboot-tools, udev, ulogd, util-linux, vala, vtun, webkit,
 	xapp_{iceauth,luit,makefontscale,sessreg,setxkbmap,smproxy},
 	xapp_{xauth,xcmsdb,xdpyinfo,xev,xgamma,xhost,xinput,xkbcomp},
 	xapp_{xkbevd,xlsatoms,xlsclients,xmodmap,xpr,xprop,xrandr,xrdb},
