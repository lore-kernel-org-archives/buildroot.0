From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 20 Jan 2019 23:29:50 +0100
Subject: [Buildroot] [git commit] package/sunxi-mali-mainline-driver: bump
 version
Message-ID: <20190120223356.1BEBB83713@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71ff12228ab4d694eb6f3062f07742f4b5410d83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For 4.20 support.

git shortlog --invert-grep --grep travis --no-merges 143ff2b17de63ce931c4f758771969e75c09a4c7..
Roman Stratiienko (1):
      mali: support building against 4.20

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash | 2 +-
 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
index 8a89d80d84..f2b18926de 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 5e3bf2007c9b5201207f436f37c96f1386b81798288b8fef0ee35c71a1cadb5b  sunxi-mali-mainline-driver-143ff2b17de63ce931c4f758771969e75c09a4c7.tar.gz
+sha256 c5f787cc498cc3e156efa70acc3fbf8dc636fba0f677aac66bdded2fda4a529d  sunxi-mali-mainline-driver-e28c274f85c65ebec82cdf0f8d021895e105d917.tar.gz
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
index c7f294cbf4..a77ee91f7e 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_MAINLINE_DRIVER_VERSION = 143ff2b17de63ce931c4f758771969e75c09a4c7
+SUNXI_MALI_MAINLINE_DRIVER_VERSION = e28c274f85c65ebec82cdf0f8d021895e105d917
 SUNXI_MALI_MAINLINE_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_MAINLINE_DRIVER_VERSION))
 SUNXI_MALI_MAINLINE_DRIVER_DEPENDENCIES = linux
 SUNXI_MALI_MAINLINE_DRIVER_LICENSE = GPL-2.0
