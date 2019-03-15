From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 15 Mar 2019 19:02:43 +0100
Subject: [Buildroot] [PATCH 17/31] package/x11r7/xapp_xstdcmap: bump version
 to 1.0.4
In-Reply-To: <20190315180256.20256-1-bernd.kuhls@t-online.de>
References: <20190315180256.20256-1-bernd.kuhls@t-online.de>
Message-ID: <20190315180256.20256-17-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xstdcmap/xapp_xstdcmap.hash | 9 +++++++--
 package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.hash b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.hash
index 6d8b35fae1..fc067850b0 100644
--- a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.hash
+++ b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2013-February/002164.html
-sha256	f648e2b0cf16aa29856de998e2c7204be39dc1f8daeda9464d32288e0b580fc1	xstdcmap-1.0.3.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-February/002954.html
+md5  da67142c128d18386ff145882e0afc66  xstdcmap-1.0.4.tar.bz2
+sha1 a5eff72ba31625e5b11506add800140019a39636  xstdcmap-1.0.4.tar.bz2
+sha256 06898b3f1eaad0b205ff3c75bdefa3207868b889d4cb37b32b8267b2bbfe6f8b  xstdcmap-1.0.4.tar.bz2
+sha512 2adbb0aec1766341e04090efa962241ff6c9e32c612851b7221cec0ee16852107d406a08ec5251070f39df882c13e3c8c9edcd88f278187a9f373e1727643a8f  xstdcmap-1.0.4.tar.bz2
+# Locally computed
+sha256 f0a362fc1b8e788845b1c0ad7ba9ade58fdfb73da750c3b9780db5d70b947657  COPYING
diff --git a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
index a4d6dc34f6..dd5b0ee349 100644
--- a/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
+++ b/package/x11r7/xapp_xstdcmap/xapp_xstdcmap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XSTDCMAP_VERSION = 1.0.3
+XAPP_XSTDCMAP_VERSION = 1.0.4
 XAPP_XSTDCMAP_SOURCE = xstdcmap-$(XAPP_XSTDCMAP_VERSION).tar.bz2
 XAPP_XSTDCMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XSTDCMAP_LICENSE = MIT
-- 
2.20.1
