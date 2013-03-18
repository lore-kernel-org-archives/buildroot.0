From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 14:04:33 +0100
Subject: [Buildroot] [PATCH 067/120] xdriver_xf86-video-tdfx: bump revision
	to X11R7.7
In-Reply-To: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
References: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611926-27105-8-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
index 5031319..db3ba8c 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
+++ b/package/x11r7/xdriver_xf86-video-tdfx/xdriver_xf86-video-tdfx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_TDFX_VERSION = 1.4.3
+XDRIVER_XF86_VIDEO_TDFX_VERSION = 1.4.4
 XDRIVER_XF86_VIDEO_TDFX_SOURCE = xf86-video-tdfx-$(XDRIVER_XF86_VIDEO_TDFX_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_TDFX_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_TDFX_AUTORECONF = YES
-- 
1.7.10.4
