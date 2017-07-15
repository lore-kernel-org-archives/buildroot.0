From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 15 Jul 2017 11:22:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: bump to version 5.46
Message-ID: <20170715092217.24477-1-bernd.kuhls@t-online.de>
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
index e7a6a8911..bc20d220b 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256 4cacb00703a6bc149cb09502257d321597d43952374a16f3558766ffa85364e9  bluez-5.45.tar.xz
+sha256 ddab3d3837c1afb8ae228a94ba17709a4650bd4db24211b6771ab735c8908e28  bluez-5.46.tar.xz
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index c69e58bff..13658cd05 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BLUEZ5_UTILS_VERSION = 5.45
+BLUEZ5_UTILS_VERSION = 5.46
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
-- 
2.11.0
