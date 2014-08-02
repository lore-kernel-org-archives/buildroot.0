From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 Aug 2014 11:18:30 +0200
Subject: [Buildroot] [PATCH 1/1] xapp_xrandr: Bump version to 1.4.3
Message-ID: <1406971112-28226-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xrandr/xapp_xrandr.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xrandr/xapp_xrandr.mk b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
index 3a0a021..16bd2c7 100644
--- a/package/x11r7/xapp_xrandr/xapp_xrandr.mk
+++ b/package/x11r7/xapp_xrandr/xapp_xrandr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XRANDR_VERSION = 1.4.2
+XAPP_XRANDR_VERSION = 1.4.3
 XAPP_XRANDR_SOURCE = xrandr-$(XAPP_XRANDR_VERSION).tar.bz2
 XAPP_XRANDR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XRANDR_LICENSE = MIT
-- 
1.7.10.4
