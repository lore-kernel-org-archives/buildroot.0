From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 22 Jun 2019 20:21:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xapp_xcalc: bump version to
 1.1.0
Message-ID: <20190622182112.915-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xcalc/xapp_xcalc.hash | 10 +++++-----
 package/x11r7/xapp_xcalc/xapp_xcalc.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xapp_xcalc/xapp_xcalc.hash b/package/x11r7/xapp_xcalc/xapp_xcalc.hash
index 283fd7e51e..d7fac37ea6 100644
--- a/package/x11r7/xapp_xcalc/xapp_xcalc.hash
+++ b/package/x11r7/xapp_xcalc/xapp_xcalc.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2019-February/002946.html
-md5 c0be45f8c26187474b763d634535d8d8  xcalc-1.0.7.tar.bz2
-sha1 f31c5a9789435b4c5a575d636f1e2ae4f96104c4  xcalc-1.0.7.tar.bz2
-sha256 70d271d1655f90ed0d4011f58022c441e1832f01eb3450c691799b131b557f21  xcalc-1.0.7.tar.bz2
-sha512 890cb9399e3c55816318ab5f0152ddba05ee141cbae6032759a3b762742ab54df8fcf0394dacc539299f93f27cbbb17aee5cbda5dde8b169a7099f20a1a38388  xcalc-1.0.7.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-June/002996.html
+md5 3b566e47c76356cecaa71eb431767ae1  xcalc-1.1.0.tar.bz2
+sha1 0537f7ee56558cf80133c6b49c4757c1166aaeb6  xcalc-1.1.0.tar.bz2
+sha256 d5d746954465afc3da1f355d721882806568fb04b4d059c027702c0d16a3b5eb  xcalc-1.1.0.tar.bz2
+sha512 877aab7bb08f409a21c26b841f4d91eb6993914ed0d26512e47d6b3d2b3e0b231158901415a106cfb45de43f03f253bf2a8733f986538d4ee810afe0e54f98d5  xcalc-1.1.0.tar.bz2
 # Locally computed
 sha256 8dd69dbec37866a41d3040c5c478aca46e0b50c30319f178064d5e2ed9d3f912  COPYING
diff --git a/package/x11r7/xapp_xcalc/xapp_xcalc.mk b/package/x11r7/xapp_xcalc/xapp_xcalc.mk
index 5cf3ca653b..b917d9e98e 100644
--- a/package/x11r7/xapp_xcalc/xapp_xcalc.mk
+++ b/package/x11r7/xapp_xcalc/xapp_xcalc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XCALC_VERSION = 1.0.7
+XAPP_XCALC_VERSION = 1.1.0
 XAPP_XCALC_SOURCE = xcalc-$(XAPP_XCALC_VERSION).tar.bz2
-XAPP_XCALC_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XCALC_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XCALC_LICENSE = MIT
 XAPP_XCALC_LICENSE_FILES = COPYING
 XAPP_XCALC_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-exec install-data
-- 
2.20.1
