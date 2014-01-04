From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 4 Jan 2014 14:38:53 +0100
Subject: [Buildroot] [PATCH 24/36] xorg: Bump xlib_libXtst version to 1.2.2
In-Reply-To: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
References: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP250F27B281D57D47E7989F5D9B50@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/x11r7/xlib_libXtst/xlib_libXtst.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXtst/xlib_libXtst.mk b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
index 46d58e2..ad3caea 100644
--- a/package/x11r7/xlib_libXtst/xlib_libXtst.mk
+++ b/package/x11r7/xlib_libXtst/xlib_libXtst.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXTST_VERSION = 1.2.1
+XLIB_LIBXTST_VERSION = 1.2.2
 XLIB_LIBXTST_SOURCE = libXtst-$(XLIB_LIBXTST_VERSION).tar.bz2
 XLIB_LIBXTST_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXTST_LICENSE = MIT
-- 
1.7.9.5
