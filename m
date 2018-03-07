From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  7 Mar 2018 21:58:41 +0100
Subject: [Buildroot] [PATCH 16/19] package/x11r7/xapp_xkbcomp: bump version
 to 1.4.1
In-Reply-To: <20180307205844.3240-1-bernd.kuhls@t-online.de>
References: <20180307205844.3240-1-bernd.kuhls@t-online.de>
Message-ID: <20180307205844.3240-16-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all upstream hashes and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash | 12 +++++++-----
 package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk   |  2 +-
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
index 4d0b5feed9..56631411d4 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.hash
@@ -1,5 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2017-May/002797.html
-md5 cc22b232bc78a303371983e1b48794ab  xkbcomp-1.4.0.tar.bz2
-sha1 9578a564ff8fcf96581fb52860828fbab8c67b4f  xkbcomp-1.4.0.tar.bz2
-sha256 bc69c8748c03c5ad9afdc8dff9db11994dd871b614c65f8940516da6bf61ce6b  xkbcomp-1.4.0.tar.bz2
-sha512 c96a63fc2d9a6ac17123297574966c45d0dcfd4ae3d4073ce863c7738d453f4c0a5f7a87c06efdec19f0b270207a7170fe1aa72a73ef1b50f95c7ca262f4882e  xkbcomp-1.4.0.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2018-March/002843.html
+md5 07df9790d30f9a369d20a418af784de0  xkbcomp-1.4.1.tar.bz2
+sha1 e7585cdb357b9d20c8f3c8a9d06f7e897934a772  xkbcomp-1.4.1.tar.bz2
+sha256 748dc4cf58ac95684106bd9cf163ac6ab7de9a236faec02a6f4d4006d63a5736  xkbcomp-1.4.1.tar.bz2
+sha512 443397e112f67e2ebc5150ec0dbf0f4a072ea39585d964d2c7cbd0569b7e0ce7d8bed0bc2c2d886343fdb060c941e65b42aac16adf189c66e90849029e278f23  xkbcomp-1.4.1.tar.bz2
+# Locally computed
+sha256 f1a78f5796fe2374f2b93e579328a02283e57d2a8316484b31799b12debe7ee3  COPYING
diff --git a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
index cc88561892..369e1f3fe3 100644
--- a/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
+++ b/package/x11r7/xapp_xkbcomp/xapp_xkbcomp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XKBCOMP_VERSION = 1.4.0
+XAPP_XKBCOMP_VERSION = 1.4.1
 XAPP_XKBCOMP_SOURCE = xkbcomp-$(XAPP_XKBCOMP_VERSION).tar.bz2
 XAPP_XKBCOMP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBCOMP_LICENSE = MIT
-- 
2.11.0
