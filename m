From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  6 Jan 2018 19:01:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: bump version to 5.48
Message-ID: <20180106180121.9756-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/bluez5_utils/bluez5_utils.hash | 2 +-
 package/bluez5_utils/bluez5_utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index 36791c9e6f..dc331b5a0d 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256 cf75bf7cd5d564f21cc4a2bd01d5c39ce425397335fd47d9bbe43af0a58342c8  bluez-5.47.tar.xz
+sha256 b9a8723072ef66bae7ec301c774902ebcb444c9c5b149b5a199e60a1ba970e90  bluez-5.48.tar.xz
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 57e9c264e1..0634ec9f6f 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BLUEZ5_UTILS_VERSION = 5.47
+BLUEZ5_UTILS_VERSION = 5.48
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
-- 
2.11.0
