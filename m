From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xbacklight to 1.1.1
Message-ID: <20100308133644.2082C7774C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=acf52641b22a8cec6c055ab9d4c9549e7d69163d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xbacklight/Config.in          |    2 +-
 package/x11r7/xapp_xbacklight/xapp_xbacklight.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xbacklight/Config.in b/package/x11r7/xapp_xbacklight/Config.in
index c0b1253..9275e58 100644
--- a/package/x11r7/xapp_xbacklight/Config.in
+++ b/package/x11r7/xapp_xbacklight/Config.in
@@ -2,5 +2,5 @@ config BR2_PACKAGE_XAPP_XBACKLIGHT
 	bool "xbacklight"
 	select BR2_PACKAGE_XLIB_LIBX11
 	help
-	  xbacklight 1.1
+	  xbacklight 1.1.1
 	  xbacklight
diff --git a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
index 9034cd3..03f62b1 100644
--- a/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
+++ b/package/x11r7/xapp_xbacklight/xapp_xbacklight.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XBACKLIGHT_VERSION = 1.1
+XAPP_XBACKLIGHT_VERSION = 1.1.1
 XAPP_XBACKLIGHT_SOURCE = xbacklight-$(XAPP_XBACKLIGHT_VERSION).tar.bz2
 XAPP_XBACKLIGHT_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XBACKLIGHT_AUTORECONF = NO
-- 
1.6.3.3
