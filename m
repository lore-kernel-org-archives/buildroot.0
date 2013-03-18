From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 13:53:17 +0100
Subject: [Buildroot] [PATCH 037/120] xapp_xwd: bump revision to X11R7.7
In-Reply-To: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
References: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611219-26971-38-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/x11r7/xapp_xwd/xapp_xwd.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xwd/xapp_xwd.mk b/package/x11r7/xapp_xwd/xapp_xwd.mk
index 94ae800..17ad452 100644
--- a/package/x11r7/xapp_xwd/xapp_xwd.mk
+++ b/package/x11r7/xapp_xwd/xapp_xwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XWD_VERSION = 1.0.4
+XAPP_XWD_VERSION = 1.0.5
 XAPP_XWD_SOURCE = xwd-$(XAPP_XWD_VERSION).tar.bz2
 XAPP_XWD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XWD_DEPENDENCIES = xlib_libX11 xlib_libXmu
-- 
1.7.10.4
