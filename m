From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Mar 2014 22:43:27 +0100
Subject: [Buildroot] [PATCH 56/91] xapp_xhost: Bump version to 1.0.6
In-Reply-To: <1396129442-26428-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396129442-26428-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396129442-26428-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <berndkuhls@hotmail.com>


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xapp_xhost/xapp_xhost.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xhost/xapp_xhost.mk b/package/x11r7/xapp_xhost/xapp_xhost.mk
index b81e1b9..d103133 100644
--- a/package/x11r7/xapp_xhost/xapp_xhost.mk
+++ b/package/x11r7/xapp_xhost/xapp_xhost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XHOST_VERSION = 1.0.5
+XAPP_XHOST_VERSION = 1.0.6
 XAPP_XHOST_SOURCE = xhost-$(XAPP_XHOST_VERSION).tar.bz2
 XAPP_XHOST_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XHOST_LICENSE = MIT
-- 
1.7.10.4
