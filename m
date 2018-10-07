From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Oct 2018 21:40:00 +0200
Subject: [Buildroot] [git commit] sunxi-mali-mainline-driver: bump version
Message-ID: <20181007193946.121D88E01C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de2ce5399291830b9dea0e285a450302f8e3f512
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For adding license information.

git shortlog --invert-grep --grep travis --no-merges 8e6b7d25b13089d53dbfc1ebd9e8737b0dc809cb..
Giulio Benetti (1):
      LICENSE: add license file according to ARM base code

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash | 3 ++-
 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk   | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
index bcc794743d..8a89d80d84 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 9f479f8ac5e013e33568901b942baf6797464ea9b7f340ee38cd469b4fd2b038  sunxi-mali-mainline-driver-8e6b7d25b13089d53dbfc1ebd9e8737b0dc809cb.tar.gz
+sha256 5e3bf2007c9b5201207f436f37c96f1386b81798288b8fef0ee35c71a1cadb5b  sunxi-mali-mainline-driver-143ff2b17de63ce931c4f758771969e75c09a4c7.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
index f69765ebb2..c7f294cbf4 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-SUNXI_MALI_MAINLINE_DRIVER_VERSION = 8e6b7d25b13089d53dbfc1ebd9e8737b0dc809cb
+SUNXI_MALI_MAINLINE_DRIVER_VERSION = 143ff2b17de63ce931c4f758771969e75c09a4c7
 SUNXI_MALI_MAINLINE_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_MAINLINE_DRIVER_VERSION))
 SUNXI_MALI_MAINLINE_DRIVER_DEPENDENCIES = linux
+SUNXI_MALI_MAINLINE_DRIVER_LICENSE = GPL-2.0
+SUNXI_MALI_MAINLINE_DRIVER_LICENSE_FILES = LICENSE
 
 SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS = \
 	$(LINUX_MAKE_FLAGS) \
