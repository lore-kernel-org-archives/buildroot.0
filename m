From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  8 May 2017 17:38:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: bump version to 5.45
Message-ID: <20170508153856.18321-1-bernd.kuhls@t-online.de>
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
index 75fb5d555..e7a6a8911 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256 0c321e291f8b45e6a78e379dfe80592b65955a0f0ab191f1cca0edd8ec356c85  bluez-5.44.tar.xz
+sha256 4cacb00703a6bc149cb09502257d321597d43952374a16f3558766ffa85364e9  bluez-5.45.tar.xz
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 4a0323488..c69e58bff 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BLUEZ5_UTILS_VERSION = 5.44
+BLUEZ5_UTILS_VERSION = 5.45
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
-- 
2.11.0
