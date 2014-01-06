From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 6 Jan 2014 21:40:06 +0100
Subject: [Buildroot] [PATCH 3/8] xorg: Bump xlib_libXcursor to version 1.1.14
In-Reply-To: <1389040811-2709-1-git-send-email-berndkuhls@hotmail.com>
References: <1389040811-2709-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP10E8F08A2E7D42A772514DD9B70@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

thanks to Jerzy Grzegorek for the hint

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/x11r7/xlib_libXcursor/xlib_libXcursor.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
index 37afa5d..508b5e2 100644
--- a/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
+++ b/package/x11r7/xlib_libXcursor/xlib_libXcursor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXCURSOR_VERSION = 1.1.13
+XLIB_LIBXCURSOR_VERSION = 1.1.14
 XLIB_LIBXCURSOR_SOURCE = libXcursor-$(XLIB_LIBXCURSOR_VERSION).tar.bz2
 XLIB_LIBXCURSOR_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXCURSOR_LICENSE = MIT
-- 
1.7.9.5
