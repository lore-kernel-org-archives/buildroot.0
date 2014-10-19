From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 13:08:15 +0200
Subject: [Buildroot] [PATCH 1/2] xserver_xorg-server: Bump version to 1.16.1
Message-ID: <1413716896-15085-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 6cbec15..9ea2e1d 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 1.16.0
+XSERVER_XORG_SERVER_VERSION = 1.16.1
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
-- 
1.7.10.4
