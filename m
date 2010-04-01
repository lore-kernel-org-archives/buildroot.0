From: Will Wagner <will_wagner@carallon.com>
Date: Thu,  1 Apr 2010 13:46:39 +0100
Subject: [Buildroot] [PATCH 09/16] xproto_xf86miscproto: bump version
In-Reply-To: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
References: <1270126006-22405-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1270126006-22405-9-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 package/x11r7/xproto_xf86miscproto/Config.in       |    2 +-
 .../xproto_xf86miscproto/xproto_xf86miscproto.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xproto_xf86miscproto/Config.in b/package/x11r7/xproto_xf86miscproto/Config.in
index e0b614c..4c1c39d 100644
--- a/package/x11r7/xproto_xf86miscproto/Config.in
+++ b/package/x11r7/xproto_xf86miscproto/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_XPROTO_XF86MISCPROTO
 	bool "xf86miscproto"
 	help
-	  xf86miscproto 0.9.2
+	  xf86miscproto 0.9.3
 	  X.Org XF86Misc protocol headers
diff --git a/package/x11r7/xproto_xf86miscproto/xproto_xf86miscproto.mk b/package/x11r7/xproto_xf86miscproto/xproto_xf86miscproto.mk
index c4317cc..8cf8482 100644
--- a/package/x11r7/xproto_xf86miscproto/xproto_xf86miscproto.mk
+++ b/package/x11r7/xproto_xf86miscproto/xproto_xf86miscproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XPROTO_XF86MISCPROTO_VERSION = 0.9.2
+XPROTO_XF86MISCPROTO_VERSION = 0.9.3
 XPROTO_XF86MISCPROTO_SOURCE = xf86miscproto-$(XPROTO_XF86MISCPROTO_VERSION).tar.bz2
 XPROTO_XF86MISCPROTO_SITE = http://xorg.freedesktop.org/releases/individual/proto
 XPROTO_XF86MISCPROTO_AUTORECONF = NO
-- 
1.7.0
