From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump mkfontscale to 1.0.7
Message-ID: <20100308133642.74F4A776E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0be40a7464f80037e2e2ac2ee1c2a9a3f6bb6ab4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_mkfontscale/Config.in           |    2 +-
 package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_mkfontscale/Config.in b/package/x11r7/xapp_mkfontscale/Config.in
index a91c9fc..43eded6 100644
--- a/package/x11r7/xapp_mkfontscale/Config.in
+++ b/package/x11r7/xapp_mkfontscale/Config.in
@@ -4,5 +4,5 @@ config BR2_PACKAGE_XAPP_MKFONTSCALE
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBFONTENC
 	help
-	  mkfontscale 1.0.3
+	  mkfontscale 1.0.7
 	  create an index of scalable font files for X
diff --git a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
index 1cbe0b4..beec9f1 100644
--- a/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
+++ b/package/x11r7/xapp_mkfontscale/xapp_mkfontscale.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_MKFONTSCALE_VERSION = 1.0.5
+XAPP_MKFONTSCALE_VERSION = 1.0.7
 XAPP_MKFONTSCALE_SOURCE = mkfontscale-$(XAPP_MKFONTSCALE_VERSION).tar.bz2
 XAPP_MKFONTSCALE_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_MKFONTSCALE_AUTORECONF = NO
-- 
1.6.3.3
