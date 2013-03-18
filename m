From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 13:53:12 +0100
Subject: [Buildroot] [PATCH 032/120] xapp_xpr: bump revision to X11R7.7
In-Reply-To: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
References: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611219-26971-33-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/x11r7/xapp_xpr/xapp_xpr.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xpr/xapp_xpr.mk b/package/x11r7/xapp_xpr/xapp_xpr.mk
index e2c944f..c1220dc 100644
--- a/package/x11r7/xapp_xpr/xapp_xpr.mk
+++ b/package/x11r7/xapp_xpr/xapp_xpr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XPR_VERSION = 1.0.3
+XAPP_XPR_VERSION = 1.0.4
 XAPP_XPR_SOURCE = xpr-$(XAPP_XPR_VERSION).tar.bz2
 XAPP_XPR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XPR_DEPENDENCIES = xlib_libX11 xlib_libXmu
-- 
1.7.10.4
