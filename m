From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 13:53:27 +0100
Subject: [Buildroot] [PATCH 047/120] xdriver_xf86-input-void: bump revision
	to X11R7.7
In-Reply-To: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
References: <1363611219-26971-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611219-26971-48-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
index 191467d..c1a8beb 100644
--- a/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
+++ b/package/x11r7/xdriver_xf86-input-void/xdriver_xf86-input-void.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_VOID_VERSION = 1.3.1
+XDRIVER_XF86_INPUT_VOID_VERSION = 1.4.0
 XDRIVER_XF86_INPUT_VOID_SOURCE = xf86-input-void-$(XDRIVER_XF86_INPUT_VOID_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_VOID_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_VOID_DEPENDENCIES = xserver_xorg-server xproto_inputproto xproto_randrproto xproto_xproto
-- 
1.7.10.4
