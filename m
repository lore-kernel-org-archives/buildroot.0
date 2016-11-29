From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 29 Nov 2016 22:04:15 +0100
Subject: [Buildroot] [PATCH/next] package/bluez5_utils: bump version to 5.43
Message-ID: <20161129210415.2444-1-bernd.kuhls@t-online.de>
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
index cbb3aa3..b030f1a 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256  21d1bc9150d3576296595217efb98a746b592389d25d5637e8bee5da7272593b    bluez-5.39.tar.xz
+sha256 16c9c05d2a1da644ce3570d975ada3643d2e60c007a955bac09c0a0efeb58d15  bluez-5.43.tar.xz
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 49cc7c2..66c3eab 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BLUEZ5_UTILS_VERSION = 5.39
+BLUEZ5_UTILS_VERSION = 5.43
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
-- 
2.10.2
