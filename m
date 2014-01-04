From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 4 Jan 2014 14:38:48 +0100
Subject: [Buildroot] [PATCH 19/36] xorg: Bump xlib_libXmu version to 1.1.2
In-Reply-To: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
References: <1388842746-12510-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP4255FC9F49C20E231FCE2E7D9B50@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/x11r7/xlib_libXmu/xlib_libXmu.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xlib_libXmu/xlib_libXmu.mk b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
index eda4151..261f871 100644
--- a/package/x11r7/xlib_libXmu/xlib_libXmu.mk
+++ b/package/x11r7/xlib_libXmu/xlib_libXmu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXMU_VERSION = 1.1.1
+XLIB_LIBXMU_VERSION = 1.1.2
 XLIB_LIBXMU_SOURCE = libXmu-$(XLIB_LIBXMU_VERSION).tar.bz2
 XLIB_LIBXMU_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXMU_LICENSE = MIT
-- 
1.7.9.5
