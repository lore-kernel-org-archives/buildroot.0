From: John Keeping <john@keeping.me.uk>
Date: Thu, 10 Dec 2015 14:01:46 +0000
Subject: [Buildroot] [PATCH 1/2] linux-firmware: bump version
Message-ID: <1449756107-9441-1-git-send-email-john@keeping.me.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: John Keeping <john@metanate.com>

CXGB4 firmware files have been renamed upstream.

Signed-off-by: John Keeping <john@metanate.com>
---
 package/linux-firmware/linux-firmware.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 768f3c4..9ae4d47 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 3161bfa479d5e9ed4f46b57df9bcecbbc4f8eb3c
+LINUX_FIRMWARE_VERSION = bbe4917c054eb0a73e250c6363341e3bf6725839
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
@@ -225,14 +225,14 @@ LINUX_FIRMWARE_FILES += \
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T4),y)
-# cxgb4/t4fw.bin is a symlink to cxgb4/t4fw-1.11.27.0.bin
-LINUX_FIRMWARE_FILES += cxgb4/t4fw-1.11.27.0.bin cxgb4/t4fw.bin
+# cxgb4/t4fw.bin is a symlink to cxgb4/t4fw-1.14.4.0.bin
+LINUX_FIRMWARE_FILES += cxgb4/t4fw-1.14.4.0.bin cxgb4/t4fw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T5),y)
-# cxgb4/t5fw.bin is a symlink to cxgb4/t5fw-1.11.27.0.bin
-LINUX_FIRMWARE_FILES += cxgb4/t5fw-1.11.27.0.bin cxgb4/t5fw.bin
+# cxgb4/t5fw.bin is a symlink to cxgb4/t5fw-1.14.4.0.bin
+LINUX_FIRMWARE_FILES += cxgb4/t5fw-1.14.4.0.bin cxgb4/t5fw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
-- 
2.6.3.462.gbe2c914
