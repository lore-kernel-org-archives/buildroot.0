From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Mar 2019 21:14:41 +0100
Subject: [Buildroot] [PATCH 11/12] package/x11r7/xlib_xtrans: bump version
 to 1.4.0
In-Reply-To: <20190324201443.21347-1-bernd.kuhls@t-online.de>
References: <20190324201443.21347-1-bernd.kuhls@t-online.de>
Message-ID: <20190324201443.21347-11-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added all hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_xtrans/xlib_xtrans.hash | 10 +++++++---
 package/x11r7/xlib_xtrans/xlib_xtrans.mk   |  2 +-
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.hash b/package/x11r7/xlib_xtrans/xlib_xtrans.hash
index 26c69a0c83..4e212c0f98 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.hash
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.hash
@@ -1,3 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2014-September/002481.html
-sha1	2d3ae1839d841f568bc481c6116af7d2a9f9ba59				xtrans-1.3.5.tar.bz2
-sha256	adbd3b36932ce4c062cd10f57d78a156ba98d618bdb6f50664da327502bc8301	xtrans-1.3.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002980.html
+md5 ce2fb8100c6647ee81451ebe388b17ad  xtrans-1.4.0.tar.bz2
+sha1 7c490026efb450798e02b040c05eba5212291c08  xtrans-1.4.0.tar.bz2
+sha256 377c4491593c417946efcd2c7600d1e62639f7a8bbca391887e2c4679807d773  xtrans-1.4.0.tar.bz2
+sha512 4fea89a3455c0e13321cbefa43340016dbb59bdd0dbdb5b796c1a6d2a6b1fd63cf1327b769ab426286b9c54b32ec764a50cd2b46228e4e43b841bda6b94de214  xtrans-1.4.0.tar.bz2
+# Locally computed
+sha256 a9c96c832e00774266b492d4d41556f12a64f039ba3ef645c4b8c6010fcb8f2a  COPYING
diff --git a/package/x11r7/xlib_xtrans/xlib_xtrans.mk b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
index 40f613cc35..88c9b57a52 100644
--- a/package/x11r7/xlib_xtrans/xlib_xtrans.mk
+++ b/package/x11r7/xlib_xtrans/xlib_xtrans.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_XTRANS_VERSION = 1.3.5
+XLIB_XTRANS_VERSION = 1.4.0
 XLIB_XTRANS_SOURCE = xtrans-$(XLIB_XTRANS_VERSION).tar.bz2
 XLIB_XTRANS_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_XTRANS_LICENSE = MIT
-- 
2.20.1
