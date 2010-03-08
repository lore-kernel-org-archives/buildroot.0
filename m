From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump mkfontdir to 1.0.5
Message-ID: <20100308133642.2D7D7776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e6d15772c74470d899f18b3180037eaafd203db6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xapp_mkfontdir/Config.in         |    2 +-
 package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xapp_mkfontdir/Config.in b/package/x11r7/xapp_mkfontdir/Config.in
index 2eeb262..e1b1064 100644
--- a/package/x11r7/xapp_mkfontdir/Config.in
+++ b/package/x11r7/xapp_mkfontdir/Config.in
@@ -2,5 +2,5 @@ config BR2_PACKAGE_XAPP_MKFONTDIR
 	bool "mkfontdir"
 	select BR2_PACKAGE_XAPP_MKFONTSCALE
 	help
-	  mkfontdir 1.0.2
+	  mkfontdir 1.0.5
 	  create an index of X font files in a directory
diff --git a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
index abd7aa0..ab9bf1b 100644
--- a/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
+++ b/package/x11r7/xapp_mkfontdir/xapp_mkfontdir.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_MKFONTDIR_VERSION = 1.0.4
+XAPP_MKFONTDIR_VERSION = 1.0.5
 XAPP_MKFONTDIR_SOURCE = mkfontdir-$(XAPP_MKFONTDIR_VERSION).tar.bz2
 XAPP_MKFONTDIR_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_MKFONTDIR_AUTORECONF = NO
-- 
1.6.3.3
