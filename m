From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 6 Jan 2014 21:40:07 +0100
Subject: [Buildroot] [PATCH 4/8] xorg: Bump xlib_libXpm to version 3.5.11
In-Reply-To: <1389040811-2709-1-git-send-email-berndkuhls@hotmail.com>
References: <1389040811-2709-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP945872CD8D2259137FFDC1D9B70@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

thanks to Jerzy Grzegorek for the hint

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/x11r7/xlib_libXpm/xlib_libXpm.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.mk b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
index e0b4f2f..86f331b 100644
--- a/package/x11r7/xlib_libXpm/xlib_libXpm.mk
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXPM_VERSION = 3.5.10
+XLIB_LIBXPM_VERSION = 3.5.11
 XLIB_LIBXPM_SOURCE = libXpm-$(XLIB_LIBXPM_VERSION).tar.bz2
 XLIB_LIBXPM_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXPM_LICENSE = MIT
-- 
1.7.9.5
