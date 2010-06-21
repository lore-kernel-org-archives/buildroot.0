From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Jun 2010 23:07:12 +0200
Subject: [Buildroot] [git commit master 1/1] ncurses: bump to 5.7
Message-ID: <20100621210810.7075D817F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c32ce8b56b0257c4e55652356b65df01c7c1e1e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2038

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    5 +++--
 package/ncurses/ncurses.mk |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 25d5233..6a455e8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -15,8 +15,8 @@
 
 	Updated/fixed packages: busybox, cdrkit, file, gawk,
 	gstreamer, intltool, ipsec-tools, iptables, libart, libidn,
-	lmbench, lrzsz, netperf, ntfsprogs, openssl, php, qt, sqlite,
-	squashfs, tn5250, usbutils, xkeyboard-config
+	lmbench, lrzsz, ncurses, netperf, ntfsprogs, openssl, php, qt,
+	sqlite, squashfs, tn5250, usbutils, xkeyboard-config
 
 	Removed packages: modutils
 
@@ -40,6 +40,7 @@
 	#1987: intltool: Fix spelling mistake
 	#1999: Typo in path checking
 	#2035: ipsec-tools-0.7.2 fails to build with gcc-4.4.x
+	#2038: Bump ncurses to 5.7
 
 2010.05, Released May 30th, 2010:
 
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 584a969..ee101f3 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -23,7 +23,7 @@
 # USA
 
 # TARGETS
-NCURSES_VERSION = 5.6
+NCURSES_VERSION = 5.7
 NCURSES_SITE = $(BR2_GNU_MIRROR)/ncurses
 NCURSES_SOURCE = ncurses-$(NCURSES_VERSION).tar.gz
 NCURSES_INSTALL_STAGING = YES
-- 
1.7.1
