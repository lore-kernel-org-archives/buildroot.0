From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Mar 2019 17:05:01 +0100
Subject: [Buildroot] [git commit] package/sunxi-mali-mainline-driver: bump
 version
Message-ID: <20190329160134.A57A689039@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3da4e07ff9f4ab9a6a6016c784d7ef522b4d38cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For 5.0 support.

git shortlog --invert-grep --grep travis --no-merges e28c274f85c65ebec82cdf0f8d021895e105d917..
Giulio Benetti (2):
      README: update instructions to copy libraries
      README: add arm64 build instructions

Roman Stratiienko (1):
      mali: support building against 5.0

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash | 2 +-
 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
index f2b18926de..83b1b269b2 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c5f787cc498cc3e156efa70acc3fbf8dc636fba0f677aac66bdded2fda4a529d  sunxi-mali-mainline-driver-e28c274f85c65ebec82cdf0f8d021895e105d917.tar.gz
+sha256 bf328106ee2510208ed4be3659b7c01149f35e4b138747e62d8ae73fb81a7b6f  sunxi-mali-mainline-driver-c12e16553576b050e74a8ed404cb555ce4b8e573.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
index a77ee91f7e..a999c4cd5b 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_MAINLINE_DRIVER_VERSION = e28c274f85c65ebec82cdf0f8d021895e105d917
+SUNXI_MALI_MAINLINE_DRIVER_VERSION = c12e16553576b050e74a8ed404cb555ce4b8e573
 SUNXI_MALI_MAINLINE_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_MAINLINE_DRIVER_VERSION))
 SUNXI_MALI_MAINLINE_DRIVER_DEPENDENCIES = linux
 SUNXI_MALI_MAINLINE_DRIVER_LICENSE = GPL-2.0
