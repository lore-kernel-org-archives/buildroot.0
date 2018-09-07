From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:41 -0000
Subject: [Buildroot] [git commit] sunxi-mali-mainline: free-electrons is now
 bootlin
Message-ID: <20180907111548.DF669826DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2faf80bbb0124ce86be40225fcc0d0cb157a0ba9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though http://github.com/free-electrons/<foo>/ properly redirects
to http://github.com/bootlin/<foo>/, it makes sense to use the
bootlin/ URL directly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sunxi-mali-mainline/Config.in              | 2 +-
 package/sunxi-mali-mainline/sunxi-mali-mainline.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-mali-mainline/Config.in b/package/sunxi-mali-mainline/Config.in
index a889864465..a2fb95bd79 100644
--- a/package/sunxi-mali-mainline/Config.in
+++ b/package/sunxi-mali-mainline/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_SUNXI_MALI_MAINLINE
 	help
 	  Install userspace Allwinner OpenGL libraries.
 
-	  https://github.com/free-electrons/mali-blobs
+	  https://github.com/bootlin/mali-blobs
 
 if BR2_PACKAGE_SUNXI_MALI_MAINLINE
 
diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
index 05b90f0bee..766bacf38d 100644
--- a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
+++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SUNXI_MALI_MAINLINE_VERSION = d691cb93884ca8ac67860502117bbec283dc19aa
-SUNXI_MALI_MAINLINE_SITE = $(call github,free-electrons,mali-blobs,$(SUNXI_MALI_MAINLINE_VERSION))
+SUNXI_MALI_MAINLINE_SITE = $(call github,bootlin,mali-blobs,$(SUNXI_MALI_MAINLINE_VERSION))
 SUNXI_MALI_MAINLINE_INSTALL_STAGING = YES
 SUNXI_MALI_MAINLINE_PROVIDES = libegl libgles
 
