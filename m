From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 00:02:04 +0100
Subject: [Buildroot] [git commit master 1/1] ethtool: bump to version 2.6.35
Message-ID: <20101104230332.E8C628DB53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fe67fb0456f8786374b387da26bd37e5b09f71c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |   20 ++++++++++----------
 package/ethtool/ethtool.mk |    8 ++------
 2 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/CHANGES b/CHANGES
index cc22bac..c7b5edd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -27,16 +27,16 @@
 	Updated/fixed packages: acpid, alsa-lib, argus, at, autoconf,
 	automake, avahi, axel, beecrypt, berkeleydb, bind, bmon, boa,
 	bootutils, bridge-utils, bsdiff, busybox, cvs, dbus, directfb,
-	dmraid, docker, dosfstools, dropbear, e2fsprogs, expat, ezxml,
-	fbset, fconfig, ffmpeg, freetype, gadgetfs-test, gamin, gawk,
-	genext2fs, gperf, gst-plugins-base, gst-plugins-ugly,
-	gtk2-themes, gtkperf, gvfs, haserl, hdparm, hostapd, hwdata,
-	ifplugd, imagemagick, iperf, ipsec-tools, iproute2, iptables,
-	iw, jpeg, kexec, kismet, less, libcgi, libcurl, libdaemon,
-	libdnet, liberation, libevent, libeXosip2, libglade, libgtk2,
-	libiconv, libidn, libintl, libmms, libmpd, libnl, liboil,
-	libosip2, libpcap, libpng, libtool, libungif, libxml2,
-	libxslt, lighttpd, lite, lm-sensors, lockfile-progs,
+	dmraid, docker, dosfstools, dropbear, e2fsprogs, ethtool,
+	expat, ezxml, fbset, fconfig, ffmpeg, freetype, gadgetfs-test,
+	gamin, gawk, genext2fs, gperf, gst-plugins-base,
+	gst-plugins-ugly, gtk2-themes, gtkperf, gvfs, haserl, hdparm,
+	hostapd, hwdata, ifplugd, imagemagick, iperf, ipsec-tools,
+	iproute2, iptables, iw, jpeg, kexec, kismet, less, libcgi,
+	libcurl, libdaemon, libdnet, liberation, libevent, libeXosip2,
+	libglade, libgtk2, libiconv, libidn, libintl, libmms, libmpd,
+	libnl, liboil, libosip2, libpcap, libpng, libtool, libungif,
+	libxml2, libxslt, lighttpd, lite, lm-sensors, lockfile-progs,
 	logrotate, m4, mdadm, mesa3d, metacity, mplayer, mtd-utils,
 	mysql_client, nano, nbd, ncftp, neon, netperf, netsnmp,
 	ng-spice-rework, ntfsprogs, ntp, openntpd, openssh, openssl,
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index f6d58fd..1fc2315 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,11 +4,7 @@
 #
 #############################################################
 
-ETHTOOL_VERSION:=6
-ETHTOOL_SOURCE:=ethtool-$(ETHTOOL_VERSION).tar.gz
-ETHTOOL_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gkernel/
-ETHTOOL_AUTORECONF:=no
-ETHTOOL_INSTALL_STAGING:=NO
-ETHTOOL_INSTALL_TARGET:=YES
+ETHTOOL_VERSION = 2.6.35
+ETHTOOL_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gkernel/
 
 $(eval $(call AUTOTARGETS,package,ethtool))
-- 
1.7.1
