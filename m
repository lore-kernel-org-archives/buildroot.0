From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 4 Jan 2014 14:38:51 +0100
Subject: [Buildroot] [PATCH 22/36] xorg: Bump xlib_libXrender version to
	0.9.8
In-Reply-To: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
References: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP473862996480887573FE467D9B50@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/x11r7/xlib_libXrender/xlib_libXrender.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.mk b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
index 4515b82..bc30112 100644
--- a/package/x11r7/xlib_libXrender/xlib_libXrender.mk
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXRENDER_VERSION = 0.9.7
+XLIB_LIBXRENDER_VERSION = 0.9.8
 XLIB_LIBXRENDER_SOURCE = libXrender-$(XLIB_LIBXRENDER_VERSION).tar.bz2
 XLIB_LIBXRENDER_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXRENDER_LICENSE = MIT
-- 
1.7.9.5
