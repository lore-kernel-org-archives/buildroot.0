From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri,  5 Oct 2018 16:58:57 +0200
Subject: [Buildroot] [PATCH 2/2] sunxi-mali-mainline-driver: add license
 information
In-Reply-To: <20181005145857.92514-1-giulio.benetti@micronovasrl.com>
References: <20181005145857.92514-1-giulio.benetti@micronovasrl.com>
Message-ID: <20181005145857.92514-2-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 .../sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash  | 1 +
 .../sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
index 58140945b1..8a89d80d84 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 5e3bf2007c9b5201207f436f37c96f1386b81798288b8fef0ee35c71a1cadb5b  sunxi-mali-mainline-driver-143ff2b17de63ce931c4f758771969e75c09a4c7.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
index 8542139894..c7f294cbf4 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
@@ -7,6 +7,8 @@
 SUNXI_MALI_MAINLINE_DRIVER_VERSION = 143ff2b17de63ce931c4f758771969e75c09a4c7
 SUNXI_MALI_MAINLINE_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_MAINLINE_DRIVER_VERSION))
 SUNXI_MALI_MAINLINE_DRIVER_DEPENDENCIES = linux
+SUNXI_MALI_MAINLINE_DRIVER_LICENSE = GPL-2.0
+SUNXI_MALI_MAINLINE_DRIVER_LICENSE_FILES = LICENSE
 
 SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS = \
 	$(LINUX_MAKE_FLAGS) \
-- 
2.17.1
