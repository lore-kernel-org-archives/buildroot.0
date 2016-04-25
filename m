From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 25 Apr 2016 14:20:20 +0200
Subject: [Buildroot] [PATCH 6/8] package/x11r7/xdriver_xf86-video-mach64:
	Update OpenGL check
In-Reply-To: <1461586822-1003-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461586822-1003-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1461586822-1003-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
index 5990360..1883b00 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
+++ b/package/x11r7/xdriver_xf86-video-mach64/xdriver_xf86-video-mach64.mk
@@ -12,7 +12,7 @@ XDRIVER_XF86_VIDEO_MACH64_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_MACH64_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_MACH64_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GL),)
 XDRIVER_XF86_VIDEO_MACH64_CONF_OPTS = --disable-dri
 endif
 
-- 
2.8.0.rc3
