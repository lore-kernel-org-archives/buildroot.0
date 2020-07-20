From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jul 2020 18:38:39 +0200
Subject: [Buildroot] [git commit branch/2020.05.x]
 package/sunxi-mali-mainline-driver: bump version
Message-ID: <20200720163617.0BEDA7FE16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=774db93d94c0865ead7101ad0f5e9efd81b443b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

For 5.6 and 5.7 support.

git shortlog --invert-grep --grep=Travis --no-merges ec654ee9caeb0c4348caacd0cf5eb2730d1d70e2..
Jonathan Liu (2):
      mali: Fix build for 5.6
      mali: Fix build for 5.7

Maxime Ripard (3):
      Create travis.yml
      actions: Add feedparser to the host
      travis: Try to fix the push code

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[yann.morin.1998 at free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 23e3cffa75b022a21088be9ec0af73a676f570f0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash | 4 ++--
 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
index 7c01d07d20..9f4b1a6694 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 98abeb8ff2e7e824ec89c7be9984ff298db1f35e48d79092238799ff5a239e91  sunxi-mali-mainline-driver-ec654ee9caeb0c4348caacd0cf5eb2730d1d70e2.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
+sha256  a2bb43ed2e64cb081e3bc814941c4de02e785f9984783061cf486d2b0b92407b  sunxi-mali-mainline-driver-a588b22f6b3d40ad18070c699f90f36ed21c9f7d.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
index 40ea450b31..3bb899041e 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_MAINLINE_DRIVER_VERSION = ec654ee9caeb0c4348caacd0cf5eb2730d1d70e2
+SUNXI_MALI_MAINLINE_DRIVER_VERSION = a588b22f6b3d40ad18070c699f90f36ed21c9f7d
 SUNXI_MALI_MAINLINE_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_MAINLINE_DRIVER_VERSION))
 SUNXI_MALI_MAINLINE_DRIVER_DEPENDENCIES = linux
 SUNXI_MALI_MAINLINE_DRIVER_LICENSE = GPL-2.0
