From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 31 Mar 2010 11:02:34 +0200
Subject: [Buildroot] [git commit master] iptables: bump version
Message-ID: <20100331090329.2DB937F99F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bc7ffe741ead045e1a24977d1c70318d54be74b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1417

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    5 +++--
 package/iptables/iptables.mk |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 585f984..34c5f5b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,8 +8,8 @@
 	New packages: librsync, lmbench, netperf, squid
 
 	Updated/fixed packages: busybox, dosfstools, e2fsprogs,
-	freetype, iperf, less, libgcrypt, libglib2, libpng, libxml2,
-	mdadm, memstat, mtd-utils, nano, openssl, php, pppd,
+	freetype, iperf, iptables, less, libgcrypt, libglib2, libpng,
+	libxml2, mdadm, memstat, mtd-utils, nano, openssl, php, pppd,
 	setserial, squashfs, wget, xlib_libXfont
 
 	Issues resolved (http://bugs.uclibc.org):
@@ -28,6 +28,7 @@
 	#1327: mtd-utils compile failure due to lack of --sysroot in CFLAGS
 	#1345: Bump pppd to 2.4.5 and convert to Makefile.autotools.in
 	#1411: [SECURITY] Update openssl package to 0.9.8n
+	#1417: Bump iptables to 1.4.7
 	#1429: [SECURITY] Update php to 5.2.13
 	#1441: Add binutils 2.20.1
 	#1447: Package installation on target with debug symbols is broken
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index f1c3768..b74321c 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -3,7 +3,7 @@
 # iptables
 #
 #############################################################
-IPTABLES_VERSION = 1.4.6
+IPTABLES_VERSION = 1.4.7
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 
-- 
1.6.3.3
