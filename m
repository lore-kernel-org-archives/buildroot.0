From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri,  5 Oct 2018 16:58:56 +0200
Subject: [Buildroot] [PATCH 1/2] sunxi-mali-mainline-driver: bump version
Message-ID: <20181005145857.92514-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For adding license information.

git shortlog --invert-grep --grep travis --no-merges 8e6b7d25b13089d53dbfc1ebd9e8737b0dc809cb..
Giulio Benetti (1):
      LICENSE: add license file according to ARM base code

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 .../sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash  | 2 +-
 .../sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
index bcc794743d..58140945b1 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 9f479f8ac5e013e33568901b942baf6797464ea9b7f340ee38cd469b4fd2b038  sunxi-mali-mainline-driver-8e6b7d25b13089d53dbfc1ebd9e8737b0dc809cb.tar.gz
+sha256 5e3bf2007c9b5201207f436f37c96f1386b81798288b8fef0ee35c71a1cadb5b  sunxi-mali-mainline-driver-143ff2b17de63ce931c4f758771969e75c09a4c7.tar.gz
diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
index f69765ebb2..8542139894 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_MALI_MAINLINE_DRIVER_VERSION = 8e6b7d25b13089d53dbfc1ebd9e8737b0dc809cb
+SUNXI_MALI_MAINLINE_DRIVER_VERSION = 143ff2b17de63ce931c4f758771969e75c09a4c7
 SUNXI_MALI_MAINLINE_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_MAINLINE_DRIVER_VERSION))
 SUNXI_MALI_MAINLINE_DRIVER_DEPENDENCIES = linux
 
-- 
2.17.1
