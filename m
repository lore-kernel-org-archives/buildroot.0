From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 6 Jan 2014 21:40:09 +0100
Subject: [Buildroot] [PATCH 6/8] xorg: Bump xlib_libXv to version 1.0.10
In-Reply-To: <1389040811-2709-1-git-send-email-berndkuhls@hotmail.com>
References: <1389040811-2709-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP87CECC64A11EFB6551E270D9B70@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

thanks to Jerzy Grzegorek for the hint

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/x11r7/xlib_libXv/xlib_libXv.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXv/xlib_libXv.mk b/package/x11r7/xlib_libXv/xlib_libXv.mk
index 8bf06c5..697e75f 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.mk
+++ b/package/x11r7/xlib_libXv/xlib_libXv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXV_VERSION = 1.0.7
+XLIB_LIBXV_VERSION = 1.0.10
 XLIB_LIBXV_SOURCE = libXv-$(XLIB_LIBXV_VERSION).tar.bz2
 XLIB_LIBXV_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXV_LICENSE = MIT
-- 
1.7.9.5
