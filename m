From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xgamma to 1.0.3
Message-ID: <20100308133645.B4FE8776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a66fa4aece9fb3008e4090c1eb99108392ff4498
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xgamma/Config.in      |    2 +-
 package/x11r7/xapp_xgamma/xapp_xgamma.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xgamma/Config.in b/package/x11r7/xapp_xgamma/Config.in
index 2028de5..d46dfbb 100644
--- a/package/x11r7/xapp_xgamma/Config.in
+++ b/package/x11r7/xapp_xgamma/Config.in
@@ -2,5 +2,5 @@ config BR2_PACKAGE_XAPP_XGAMMA
 	bool "xgamma"
 	select BR2_PACKAGE_XLIB_LIBXXF86VM
 	help
-	  xgamma 1.0.1
+	  xgamma 1.0.3
 	  Alter a monitor's gamma correction through the X server
diff --git a/package/x11r7/xapp_xgamma/xapp_xgamma.mk b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
index 2884a7f..2bdaa27 100644
--- a/package/x11r7/xapp_xgamma/xapp_xgamma.mk
+++ b/package/x11r7/xapp_xgamma/xapp_xgamma.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XGAMMA_VERSION = 1.0.2
+XAPP_XGAMMA_VERSION = 1.0.3
 XAPP_XGAMMA_SOURCE = xgamma-$(XAPP_XGAMMA_VERSION).tar.bz2
 XAPP_XGAMMA_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XGAMMA_AUTORECONF = NO
-- 
1.6.3.3
