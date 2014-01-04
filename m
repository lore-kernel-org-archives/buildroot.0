From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 4 Jan 2014 14:38:36 +0100
Subject: [Buildroot] [PATCH 07/36] xorg: Bump xlib_libfontenc version to
	1.1.2
In-Reply-To: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
References: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP460F2A3E624007A686B947BD9B50@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
index d47a7d3..fd7a6fb 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBFONTENC_VERSION = 1.1.1
+XLIB_LIBFONTENC_VERSION = 1.1.2
 XLIB_LIBFONTENC_SOURCE = libfontenc-$(XLIB_LIBFONTENC_VERSION).tar.bz2
 XLIB_LIBFONTENC_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBFONTENC_LICENSE = MIT
-- 
1.7.9.5
