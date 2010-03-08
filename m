From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xwd to 1.0.3
Message-ID: <20100308133650.72172776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f7167feb1df260887254abab727f4626c467cd4f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xwd/Config.in   |    2 +-
 package/x11r7/xapp_xwd/xapp_xwd.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xwd/Config.in b/package/x11r7/xapp_xwd/Config.in
index 82c5385..15c08fa 100644
--- a/package/x11r7/xapp_xwd/Config.in
+++ b/package/x11r7/xapp_xwd/Config.in
@@ -3,5 +3,5 @@ config BR2_PACKAGE_XAPP_XWD
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
-	  xwd 1.0.1
+	  xwd 1.0.3
 	  dump an image of an X window
diff --git a/package/x11r7/xapp_xwd/xapp_xwd.mk b/package/x11r7/xapp_xwd/xapp_xwd.mk
index 00da828..bdd6182 100644
--- a/package/x11r7/xapp_xwd/xapp_xwd.mk
+++ b/package/x11r7/xapp_xwd/xapp_xwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XWD_VERSION = 1.0.2
+XAPP_XWD_VERSION = 1.0.3
 XAPP_XWD_SOURCE = xwd-$(XAPP_XWD_VERSION).tar.bz2
 XAPP_XWD_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XWD_AUTORECONF = NO
-- 
1.6.3.3
