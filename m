From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 15 Mar 2019 19:02:32 +0100
Subject: [Buildroot] [PATCH 06/31] package/x11r7/xapp_xev: bump version to
 1.2.3
In-Reply-To: <20190315180256.20256-1-bernd.kuhls@t-online.de>
References: <20190315180256.20256-1-bernd.kuhls@t-online.de>
Message-ID: <20190315180256.20256-6-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xev/xapp_xev.hash | 9 +++++++--
 package/x11r7/xapp_xev/xapp_xev.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xev/xapp_xev.hash b/package/x11r7/xapp_xev/xapp_xev.hash
index 4008ebafae..160e09e4f3 100644
--- a/package/x11r7/xapp_xev/xapp_xev.hash
+++ b/package/x11r7/xapp_xev/xapp_xev.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002572.html
-sha256	d94ae62a6c1af56c2961d71f5782076ac4116f0fa4e401420ac7e0db33dc314f	xev-1.2.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-February/002948.html
+md5 eec82a5d4b599736f0fa637e96136746  xev-1.2.3.tar.bz2
+sha1 3a294934b9e150abc3cccc4182a40ed9b5ea9871  xev-1.2.3.tar.bz2
+sha256 66bc4f1cfa1946d62612737815c34164e4ce40fcebd2c9e1d7e7a1117ad3ad09  xev-1.2.3.tar.bz2
+sha512 47cc7ac096e77cfa4e687914d767263cf3e1dca5bffd0f68c7ba0fe751b248c8a16525bd2da4d6efa0ea8d637831c893d41c9687cace4aaa9c0909a45ef1943e  xev-1.2.3.tar.bz2
+# Locally computed
+sha256 9b840f2e1900889124cc999f3158da2b6b07bf6d0d77bdbb01ce65d2e702dc83  COPYING
diff --git a/package/x11r7/xapp_xev/xapp_xev.mk b/package/x11r7/xapp_xev/xapp_xev.mk
index 2a798db555..137a6f2050 100644
--- a/package/x11r7/xapp_xev/xapp_xev.mk
+++ b/package/x11r7/xapp_xev/xapp_xev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XEV_VERSION = 1.2.2
+XAPP_XEV_VERSION = 1.2.3
 XAPP_XEV_SOURCE = xev-$(XAPP_XEV_VERSION).tar.bz2
 XAPP_XEV_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XEV_LICENSE = MIT
-- 
2.20.1
