From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Jul 2019 23:02:07 +0200
Subject: [Buildroot] [git commit] package/sunxi-mali-mainline-driver: bump
 version
Message-ID: <20190726210111.79CB588069@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6132bcb788f15460d8c37715f5bbbcf0d0163d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For 5.1 support.

git shortlog --invert-grep --grep=travis --no-merges
c12e16553576b050e74a8ed404cb555ce4b8e573..
Giulio Benetti (1):
      README: update mali-blobs URL

Maxime Ripard (1):
      Fix build with 5.1

Roman Stratiienko (2):
      Add r9p0 version
      Enable r9p0 build

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash | 2 +-
 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
index 83b1b269b2..4bbea8f633 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 bf328106ee2510208ed4be3659b7c01149f35e4b138747e62d8ae73fb81a7b6f  sunxi-mali-mainline-driver-c12e16553576b050e74a8ed404cb555ce4b8e573.tar.gz
+sha256 670951ef0f268f3a516116788ea8edc99a783c528859b4b31ad17652e4e8babb  sunxi-mali-mainline-driver-edd3cf4ae7ea5ec573a0eccfbbeb985244499a00.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
index a999c4cd5b..4e6d98902a 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_MAINLINE_DRIVER_VERSION = c12e16553576b050e74a8ed404cb555ce4b8e573
+SUNXI_MALI_MAINLINE_DRIVER_VERSION = edd3cf4ae7ea5ec573a0eccfbbeb985244499a00
 SUNXI_MALI_MAINLINE_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_MAINLINE_DRIVER_VERSION))
 SUNXI_MALI_MAINLINE_DRIVER_DEPENDENCIES = linux
 SUNXI_MALI_MAINLINE_DRIVER_LICENSE = GPL-2.0
