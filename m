From: Will Wagner <will_wagner@carallon.com>
Date: Thu,  1 Apr 2010 13:46:44 +0100
Subject: [Buildroot] [PATCH 14/16] xlib_libXxf86misc: bump version
In-Reply-To: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
References: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1270126006-22405-14-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/xlib_libXxf86misc/Config.in          |    2 +-
 .../x11r7/xlib_libXxf86misc/xlib_libXxf86misc.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xlib_libXxf86misc/Config.in b/package/x11r7/xlib_libXxf86misc/Config.in
index 3f8bac1..8e11b77 100644
--- a/package/x11r7/xlib_libXxf86misc/Config.in
+++ b/package/x11r7/xlib_libXxf86misc/Config.in
@@ -5,5 +5,5 @@ config BR2_PACKAGE_XLIB_LIBXXF86MISC
 	select BR2_PACKAGE_XPROTO_XF86MISCPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  libXxf86misc 1.0.1
+	  libXxf86misc 1.0.2
 	  X.Org Xxf86misc library
diff --git a/package/x11r7/xlib_libXxf86misc/xlib_libXxf86misc.mk b/package/x11r7/xlib_libXxf86misc/xlib_libXxf86misc.mk
index 821170b..5f4b793 100644
--- a/package/x11r7/xlib_libXxf86misc/xlib_libXxf86misc.mk
+++ b/package/x11r7/xlib_libXxf86misc/xlib_libXxf86misc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXXF86MISC_VERSION = 1.0.1
+XLIB_LIBXXF86MISC_VERSION = 1.0.2
 XLIB_LIBXXF86MISC_SOURCE = libXxf86misc-$(XLIB_LIBXXF86MISC_VERSION).tar.bz2
 XLIB_LIBXXF86MISC_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXXF86MISC_AUTORECONF = NO
-- 
1.7.0
