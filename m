From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 16 Jul 2019 22:03:14 +0200
Subject: [Buildroot] [PATCH 2/3] package/x11r7/xapp_xbacklight: bump version
 to 1.2.3
In-Reply-To: <20190716200315.16460-1-bernd.kuhls@t-online.de>
References: <20190716200315.16460-1-bernd.kuhls@t-online.de>
Message-ID: <20190716200315.16460-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Updated _SITE according to release notes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xbacklight/xapp_xbacklight.hash | 10 +++++-----
 package/x11r7/xapp_xbacklight/xapp_xbacklight.mk   |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/x11r7/xapp_xbacklight/xapp_xbacklight.hash b/package/x11r7/xapp_xbacklight/xapp_xbacklight.hash
index b2aa760600..12d20525c2 100644
--- a/package/x11r7/xapp_xbacklight/xapp_xbacklight.hash
+++ b/package/x11r7/xapp_xbacklight/xapp_xbacklight.hash
@@ -1,7 +1,7 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002862.html
-md5 d50cf135af04436b9456a5ab7dcf7971  xbacklight-1.2.2.tar.bz2
-sha1 8cc84c4b2e23e99bfa72239847af4b42ae89669e  xbacklight-1.2.2.tar.bz2
-sha256 615a1d13e429ed5a0300b2f4508bc199d7cf21b6b9f088a9d8188d3bc957bf5e  xbacklight-1.2.2.tar.bz2
-sha512 4dca70ef8e3494b19ea126c46395807cddc007b2b09a133810daeb77ae27fa36ac4eec7813828248fc195abe27f59700cfa58ee65ef3a020a51f73e5107678ec  xbacklight-1.2.2.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-July/003008.html
+md5 5b6405973db69c0443be2fba8e1a8ab7  xbacklight-1.2.3.tar.bz2
+sha1 f0a6163738143ec23542b459aef567309a119e0c  xbacklight-1.2.3.tar.bz2
+sha256 3a27f324777ae99fee476cfb2f064576fb8cba4eb77f97cda37adda1c1d39ade  xbacklight-1.2.3.tar.bz2
+sha512 717c87ce24634892fc4ac54fc59dcc0a5bc8f206aaf1d13410f95f7e4fe6e3dbc7ff8d951bcd8ea8c5e955357a00fea6ceadd4559e60b1a632e40f71290e12c7  xbacklight-1.2.3.tar.bz2
 # Locally computed
 sha256 c9fbf1f272215babef31808c1235de8e4f7641ca5edfc4fc615b6556054b2b04 COPYING
diff --git a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
index a2907bb288..d52d562ceb 100644
--- a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
+++ b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XBACKLIGHT_VERSION = 1.2.2
+XAPP_XBACKLIGHT_VERSION = 1.2.3
 XAPP_XBACKLIGHT_SOURCE = xbacklight-$(XAPP_XBACKLIGHT_VERSION).tar.bz2
-XAPP_XBACKLIGHT_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XBACKLIGHT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XBACKLIGHT_LICENSE = MIT
 XAPP_XBACKLIGHT_LICENSE_FILES = COPYING
 XAPP_XBACKLIGHT_DEPENDENCIES = xlib_libX11 xlib_libXrandr xlib_libXrender xcb-util
-- 
2.20.1
