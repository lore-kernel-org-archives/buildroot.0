From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 14:04:37 +0100
Subject: [Buildroot] [PATCH 071/120] xdriver_xf86-video-wsfb: bump revision
	to X11R7.7
In-Reply-To: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
References: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611926-27105-12-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk b/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
index 355e42c..c2948b2 100644
--- a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
+++ b/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_WSFB_VERSION = 0.3.0
+XDRIVER_XF86_VIDEO_WSFB_VERSION = 0.4.0
 XDRIVER_XF86_VIDEO_WSFB_SOURCE = xf86-video-wsfb-$(XDRIVER_XF86_VIDEO_WSFB_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_WSFB_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_WSFB_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
-- 
1.7.10.4
