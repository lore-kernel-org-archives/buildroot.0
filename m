From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 14:04:51 +0100
Subject: [Buildroot] [PATCH 085/120] xlib_libXfont: bump revision to X11R7.7
In-Reply-To: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
References: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611926-27105-26-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/x11r7/xlib_libXfont/Config.in        |    1 -
 package/x11r7/xlib_libXfont/xlib_libXfont.mk |    4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xlib_libXfont/Config.in b/package/x11r7/xlib_libXfont/Config.in
index 407a099..cc1da0e 100644
--- a/package/x11r7/xlib_libXfont/Config.in
+++ b/package/x11r7/xlib_libXfont/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_XLIB_LIBXFONT
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_XLIB_LIBFONTENC
 	select BR2_PACKAGE_XLIB_XTRANS
-	select BR2_PACKAGE_XPROTO_FONTCACHEPROTO
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XFONT_ENCODINGS
diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index c08a69b..72f9416 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-XLIB_LIBXFONT_VERSION = 1.4.3
+XLIB_LIBXFONT_VERSION = 1.4.5
 XLIB_LIBXFONT_SOURCE = libXfont-$(XLIB_LIBXFONT_VERSION).tar.bz2
 XLIB_LIBXFONT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFONT_AUTORECONF = YES
 XLIB_LIBXFONT_INSTALL_STAGING = YES
-XLIB_LIBXFONT_DEPENDENCIES = freetype xlib_libfontenc xlib_xtrans xproto_fontcacheproto xproto_fontsproto xproto_xproto xfont_encodings
+XLIB_LIBXFONT_DEPENDENCIES = freetype xlib_libfontenc xlib_xtrans xproto_fontsproto xproto_xproto xfont_encodings
 XLIB_LIBXFONT_CONF_OPT = --disable-devel-docs
 
 HOST_XLIB_LIBXFONT_CONF_OPT = --disable-devel-docs
-- 
1.7.10.4
