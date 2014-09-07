From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Sep 2014 12:08:07 +0200
Subject: [Buildroot] [PATCH] xdriver_xf86-input-mouse: Bump version to 1.9.1
In-Reply-To: <1410084487-6023-1-git-send-email-bernd.kuhls@t-online.de>
References: <1410084487-6023-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1410084487-6023-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
index 836b8dd..0e19467 100644
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
+++ b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.9.0
+XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.9.1
 XDRIVER_XF86_INPUT_MOUSE_SOURCE = xf86-input-mouse-$(XDRIVER_XF86_INPUT_MOUSE_VERSION).tar.bz2
 XDRIVER_XF86_INPUT_MOUSE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_INPUT_MOUSE_LICENSE = MIT
-- 
1.7.10.4
