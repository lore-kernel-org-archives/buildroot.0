From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 15 Mar 2019 19:02:39 +0100
Subject: [Buildroot] [PATCH 13/31] package/x11r7/xapp_xmodmap: bump version
 to 1.0.10
In-Reply-To: <20190315180256.20256-1-bernd.kuhls@t-online.de>
References: <20190315180256.20256-1-bernd.kuhls@t-online.de>
Message-ID: <20190315180256.20256-13-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xmodmap/xapp_xmodmap.hash | 9 +++++++--
 package/x11r7/xapp_xmodmap/xapp_xmodmap.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xmodmap/xapp_xmodmap.hash b/package/x11r7/xapp_xmodmap/xapp_xmodmap.hash
index aad981522d..4925ec00a3 100644
--- a/package/x11r7/xapp_xmodmap/xapp_xmodmap.hash
+++ b/package/x11r7/xapp_xmodmap/xapp_xmodmap.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002583.html
-sha256	b7b0e5cc5f10d0fb6d2d6ea4f00c77e8ac0e847cc5a73be94cd86139ac4ac478	xmodmap-1.0.9.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-February/002952.html
+md5 51f1d30a525e9903280ffeea2744b1f6  xmodmap-1.0.10.tar.bz2
+sha1 69e041f8a8c501bd1feb68805a0880633a685bc8  xmodmap-1.0.10.tar.bz2
+sha256 473f0941d7439d501bb895ff358832b936ec34c749b9704c37a15e11c318487c  xmodmap-1.0.10.tar.bz2
+sha512 324c7dcef843186088f16b3bc47485eb3c9b4331e56ce43b692deb4bb3d4f4f27512480e91a379cceac8383df920dc5e37cd825246b50b6343291cec48134c04  xmodmap-1.0.10.tar.bz2
+# Locally computed
+sha256 c149563cf2cb0ecfb1148b6eb8f604c62bed43452a0d0fbafb97286a97840f5c  COPYING
diff --git a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk b/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
index 670bf9f41f..f3a458b7b5 100644
--- a/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
+++ b/package/x11r7/xapp_xmodmap/xapp_xmodmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XMODMAP_VERSION = 1.0.9
+XAPP_XMODMAP_VERSION = 1.0.10
 XAPP_XMODMAP_SOURCE = xmodmap-$(XAPP_XMODMAP_VERSION).tar.bz2
 XAPP_XMODMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XMODMAP_LICENSE = MIT
-- 
2.20.1
