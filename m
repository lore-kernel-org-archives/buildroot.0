From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xpr to 1.0.3
Message-ID: <20100308133648.6F46B776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2b63b7f7c06d76b803e9375cc709b6e89e7c257b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_xpr/Config.in   |    2 +-
 package/x11r7/xapp_xpr/xapp_xpr.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_xpr/Config.in b/package/x11r7/xapp_xpr/Config.in
index d87fcb1..34b1c83 100644
--- a/package/x11r7/xapp_xpr/Config.in
+++ b/package/x11r7/xapp_xpr/Config.in
@@ -3,5 +3,5 @@ config BR2_PACKAGE_XAPP_XPR
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXMU
 	help
-	  xpr 1.0.1
+	  xpr 1.0.3
 	  X.Org xpr application
diff --git a/package/x11r7/xapp_xpr/xapp_xpr.mk b/package/x11r7/xapp_xpr/xapp_xpr.mk
index a735303..257d10b 100644
--- a/package/x11r7/xapp_xpr/xapp_xpr.mk
+++ b/package/x11r7/xapp_xpr/xapp_xpr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XPR_VERSION = 1.0.2
+XAPP_XPR_VERSION = 1.0.3
 XAPP_XPR_SOURCE = xpr-$(XAPP_XPR_VERSION).tar.bz2
 XAPP_XPR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XPR_AUTORECONF = NO
-- 
1.6.3.3
