From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 Sep 2010 00:35:26 +0200
Subject: [Buildroot] [git commit master 1/1] iperf: bump to 2.0.5
Message-ID: <20100925223540.27FEA8B43F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ba85f9b11f6b51dd0e91181d37457ada141fedd8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    4 ++--
 package/iperf/iperf.mk |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 54ddd74..73b9762 100644
--- a/CHANGES
+++ b/CHANGES
@@ -20,8 +20,8 @@
 	Updated/fixed packages: alsa-lib, at, avahi, berkeleydb, bind,
 	bmon, bridge-utils, busybox, dbus, dmraid, docker, dropbear,
 	e2fsprogs, expat, freetype, gawk, gvfs, haserl, hostapd,
-	ifplugd, iproute2, iptables, jpeg, kexec, kismet, less, libcurl,
-	libdnet, libevent, libglade, libgtk2, libiconv, libidn,
+	ifplugd, iperf, iproute2, iptables, jpeg, kexec, kismet, less,
+	libcurl, libdnet, libevent, libglade, libgtk2, libiconv, libidn,
 	libmms, libnl, liboil, libpcap, libpng, libungif, libxml2,
 	libxslt, lighttpd, lite, m4, mdadm, metacity, mtd-utils,
 	mysql_client, nano, nbd, ncftp, neon, netperf, ntfsprogs, ntp,
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 3f8e3fc..843b53b 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -3,7 +3,7 @@
 # iperf
 #
 #############################################################
-IPERF_VERSION = 2.0.4
+IPERF_VERSION = 2.0.5
 IPERF_SOURCE = iperf-$(IPERF_VERSION).tar.gz
 IPERF_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/iperf
 
-- 
1.7.1
