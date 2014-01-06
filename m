From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 6 Jan 2014 21:40:05 +0100
Subject: [Buildroot] [PATCH 2/8] xorg: Bump xlib_libXaw to version 1.0.12
In-Reply-To: <1389040811-2709-1-git-send-email-berndkuhls@hotmail.com>
References: <1389040811-2709-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP9293DD7BB718CC9FDF8D89D9B70@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

thanks to Jerzy Grzegorek for the hint

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/x11r7/xlib_libXaw/xlib_libXaw.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.mk b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
index fd4c573..3bbd181 100644
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.mk
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXAW_VERSION = 1.0.11
+XLIB_LIBXAW_VERSION = 1.0.12
 XLIB_LIBXAW_SOURCE = libXaw-$(XLIB_LIBXAW_VERSION).tar.bz2
 XLIB_LIBXAW_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXAW_LICENSE = MIT
-- 
1.7.9.5
