From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 6 Jan 2014 21:40:11 +0100
Subject: [Buildroot] [PATCH 8/8] xorg: Bump xlib_libdmx to version 1.1.3
In-Reply-To: <1389040811-2709-1-git-send-email-berndkuhls@hotmail.com>
References: <1389040811-2709-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP345C2A40CABE380BCB5CFAD9B70@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

thanks to Jerzy Grzegorek for the hint

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/x11r7/xlib_libdmx/xlib_libdmx.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libdmx/xlib_libdmx.mk b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
index 73c4b65..c720db6 100644
--- a/package/x11r7/xlib_libdmx/xlib_libdmx.mk
+++ b/package/x11r7/xlib_libdmx/xlib_libdmx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBDMX_VERSION = 1.1.2
+XLIB_LIBDMX_VERSION = 1.1.3
 XLIB_LIBDMX_SOURCE = libdmx-$(XLIB_LIBDMX_VERSION).tar.bz2
 XLIB_LIBDMX_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBDMX_LICENSE = MIT
-- 
1.7.9.5
