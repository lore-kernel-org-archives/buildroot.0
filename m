From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Dec 2019 21:32:35 +0100
Subject: [Buildroot] [git commit branch/2019.11.x]
 package/sunxi-mali-mainline-driver: bump version
Message-ID: <20191222204328.44BBD8D6D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b36b456e4917dbcf1ecf46dc681011c261d50cb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

For A64 frequency stability.

git shortlog --invert-grep --grep=travis --no-merges
a5e38ca3f05f0f74fdd5e85a711c964383ad23df..
Vasily Khoruzhick (1):
      Set GPU clock to 432MHz on A64

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bb6e4a3b5e63fcee869cbc46e3dbd66c3fc9e412)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash | 2 +-
 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
index c5ab760904..7c01d07d20 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 f53e83654fb3e6a9fdccdcc11f28d387f4b8b42f9857d51e928b4ccde39c4caf  sunxi-mali-mainline-driver-a5e38ca3f05f0f74fdd5e85a711c964383ad23df.tar.gz
+sha256 98abeb8ff2e7e824ec89c7be9984ff298db1f35e48d79092238799ff5a239e91  sunxi-mali-mainline-driver-ec654ee9caeb0c4348caacd0cf5eb2730d1d70e2.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
index bcb0bbcc01..0edcdee4d6 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_MAINLINE_DRIVER_VERSION = a5e38ca3f05f0f74fdd5e85a711c964383ad23df
+SUNXI_MALI_MAINLINE_DRIVER_VERSION = ec654ee9caeb0c4348caacd0cf5eb2730d1d70e2
 SUNXI_MALI_MAINLINE_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_MAINLINE_DRIVER_VERSION))
 SUNXI_MALI_MAINLINE_DRIVER_DEPENDENCIES = linux
 SUNXI_MALI_MAINLINE_DRIVER_LICENSE = GPL-2.0
