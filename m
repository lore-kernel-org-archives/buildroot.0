From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 14:04:28 +0100
Subject: [Buildroot] [PATCH 062/120] xdriver_xf86-video-openchrome: bump
	revision to X11R7.7
In-Reply-To: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
References: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611926-27105-3-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 .../xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk   |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
index 9abc02e..e61a369 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
@@ -3,7 +3,7 @@
 # openchrome
 #
 #############################################################
-XDRIVER_XF86_VIDEO_OPENCHROME_VERSION = 0.2.904
+XDRIVER_XF86_VIDEO_OPENCHROME_VERSION = 0.2.906
 XDRIVER_XF86_VIDEO_OPENCHROME_SOURCE = xf86-video-openchrome-$(XDRIVER_XF86_VIDEO_OPENCHROME_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_OPENCHROME_SITE = http://www.openchrome.org/releases
 
-- 
1.7.10.4
