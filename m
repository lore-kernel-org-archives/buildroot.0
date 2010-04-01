From: Will Wagner <will_wagner@carallon.com>
Date: Thu,  1 Apr 2010 13:46:41 +0100
Subject: [Buildroot] [PATCH 11/16] xlib_libXfontcache: bump version
In-Reply-To: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
References: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1270126006-22405-11-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/xlib_libXfontcache/Config.in         |    2 +-
 .../x11r7/xlib_libXfontcache/xlib_libXfontcache.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXfontcache/Config.in b/package/x11r7/xlib_libXfontcache/Config.in
index 50d2cce..202ae6d 100644
--- a/package/x11r7/xlib_libXfontcache/Config.in
+++ b/package/x11r7/xlib_libXfontcache/Config.in
@@ -4,5 +4,5 @@ config BR2_PACKAGE_XLIB_LIBXFONTCACHE
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XPROTO_FONTCACHEPROTO
 	help
-	  libXfontcache 1.0.4
+	  libXfontcache 1.0.5
 	  X.Org Xfontcache library
diff --git a/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk b/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
index b51d61b..a0d924b 100644
--- a/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
+++ b/package/x11r7/xlib_libXfontcache/xlib_libXfontcache.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFONTCACHE_VERSION = 1.0.4
+XLIB_LIBXFONTCACHE_VERSION = 1.0.5
 XLIB_LIBXFONTCACHE_SOURCE = libXfontcache-$(XLIB_LIBXFONTCACHE_VERSION).tar.bz2
 XLIB_LIBXFONTCACHE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFONTCACHE_AUTORECONF = NO
-- 
1.7.0
