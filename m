From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Oct 2010 09:08:08 +0200
Subject: [Buildroot] [git commit master 1/1] iw: bump version
Message-ID: <20101004071614.0524C8B8B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e50b4dcbf9a5cf9f391ab0ad72880b5e85ae6dec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES          |    8 ++++----
 package/iw/iw.mk |    2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index 23a264c..a1168d7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -29,10 +29,10 @@
 	docker, dosfstools, dropbear, e2fsprogs, expat, ezxml, fbset,
 	fconfig, ffmpeg, freetype, gadgetfs-test, gamin, gawk, gperf,
 	gtk2-themes, gtkperf, gvfs, haserl, hdparm, hostapd, hwdata,
-	ifplugd, iperf, iproute2, iptables, jpeg, kexec, kismet, less,
-	libcgi, libcurl, libdaemon, libdnet, liberation, libevent,
-	libglade, libgtk2, libiconv, libidn, libmms, libnl, liboil,
-	libpcap, libpng, libtool, libungif, libxml2, libxslt,
+	ifplugd, iperf, iproute2, iptables, iw, jpeg, kexec, kismet,
+	less, libcgi, libcurl, libdaemon, libdnet, liberation,
+	libevent, libglade, libgtk2, libiconv, libidn, libmms, libnl,
+	liboil, libpcap, libpng, libtool, libungif, libxml2, libxslt,
 	lighttpd, lite, lm-sensors, lockfile-progs, logrotate, m4,
 	mdadm, mesa3d, metacity, mtd-utils, mysql_client, nano, nbd,
 	ncftp, neon, netperf, netsnmp, ng-spice-rework, ntfsprogs,
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 0f8851a..2c93516 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IW_VERSION = 0.9.20
+IW_VERSION = 0.9.21
 IW_SOURCE = iw-$(IW_VERSION).tar.bz2
 IW_SITE = http://wireless.kernel.org/download/iw
 IW_DEPENDENCIES = host-pkg-config libnl
-- 
1.7.1
