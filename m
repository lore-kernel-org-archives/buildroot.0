From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 13:52:55 +0100
Subject: [Buildroot] [PATCH 015/120] xapp_luit: bump revision to X11R7.7
In-Reply-To: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
References: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611219-26971-16-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/x11r7/xapp_luit/xapp_luit.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_luit/xapp_luit.mk b/package/x11r7/xapp_luit/xapp_luit.mk
index 7a0ab35..ddb7883 100644
--- a/package/x11r7/xapp_luit/xapp_luit.mk
+++ b/package/x11r7/xapp_luit/xapp_luit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_LUIT_VERSION = 1.1.0
+XAPP_LUIT_VERSION = 1.1.1
 XAPP_LUIT_SOURCE = luit-$(XAPP_LUIT_VERSION).tar.bz2
 XAPP_LUIT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_LUIT_DEPENDENCIES = xlib_libX11 xlib_libfontenc
-- 
1.7.10.4
