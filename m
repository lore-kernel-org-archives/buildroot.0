From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 6 Jan 2014 21:40:08 +0100
Subject: [Buildroot] [PATCH 5/8] xorg: Bump xlib_libXres to version 1.0.7
In-Reply-To: <1389040811-2709-1-git-send-email-berndkuhls@hotmail.com>
References: <1389040811-2709-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP7CDDF619199817DAFD466D9B70@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

thanks to Jerzy Grzegorek for the hint

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/x11r7/xlib_libXres/xlib_libXres.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXres/xlib_libXres.mk b/package/x11r7/xlib_libXres/xlib_libXres.mk
index 8d5b79b..b75ddd9 100644
--- a/package/x11r7/xlib_libXres/xlib_libXres.mk
+++ b/package/x11r7/xlib_libXres/xlib_libXres.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXRES_VERSION = 1.0.6
+XLIB_LIBXRES_VERSION = 1.0.7
 XLIB_LIBXRES_SOURCE = libXres-$(XLIB_LIBXRES_VERSION).tar.bz2
 XLIB_LIBXRES_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRES_LICENSE = MIT
-- 
1.7.9.5
