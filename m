From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 21:05:30 +0200
Subject: [Buildroot] [git commit] package/sunxi-mali-mainline-driver: bump
 version
Message-ID: <20191002190051.9DA988815B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d23024e94691b22ae450665d8e59f15aa84e5430
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For 5.3 support.

git shortlog --invert-grep --grep=travis --no-merges
edd3cf4ae7ea5ec573a0eccfbbeb985244499a00..
John-Eric Kamps (2):
      Add allwinner A64 support
      Fixed SoB

Maxime Ripard (1):
      mali: Fix build for 5.3

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash | 2 +-
 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
index 4bbea8f633..c5ab760904 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 670951ef0f268f3a516116788ea8edc99a783c528859b4b31ad17652e4e8babb  sunxi-mali-mainline-driver-edd3cf4ae7ea5ec573a0eccfbbeb985244499a00.tar.gz
+sha256 f53e83654fb3e6a9fdccdcc11f28d387f4b8b42f9857d51e928b4ccde39c4caf  sunxi-mali-mainline-driver-a5e38ca3f05f0f74fdd5e85a711c964383ad23df.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
index 4e6d98902a..bcb0bbcc01 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_MAINLINE_DRIVER_VERSION = edd3cf4ae7ea5ec573a0eccfbbeb985244499a00
+SUNXI_MALI_MAINLINE_DRIVER_VERSION = a5e38ca3f05f0f74fdd5e85a711c964383ad23df
 SUNXI_MALI_MAINLINE_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_MAINLINE_DRIVER_VERSION))
 SUNXI_MALI_MAINLINE_DRIVER_DEPENDENCIES = linux
 SUNXI_MALI_MAINLINE_DRIVER_LICENSE = GPL-2.0
