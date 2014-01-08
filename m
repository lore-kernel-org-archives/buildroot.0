From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Wed, 8 Jan 2014 19:25:24 +0100
Subject: [Buildroot] [PATCH 1/1] xorg: Bump xlib_libXfont version to 1.4.7
Message-ID: <BLU0-SMTP123C86DC2F5240BB0AA92F2D9B10@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVE-2013-6462: unlimited sscanf overflows stack buffer in bdfReadCharacters()

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/x11r7/xlib_libXfont/xlib_libXfont.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index 735c5e7..b692d08 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFONT_VERSION = 1.4.6
+XLIB_LIBXFONT_VERSION = 1.4.7
 XLIB_LIBXFONT_SOURCE = libXfont-$(XLIB_LIBXFONT_VERSION).tar.bz2
 XLIB_LIBXFONT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFONT_LICENSE = MIT
-- 
1.7.9.5
