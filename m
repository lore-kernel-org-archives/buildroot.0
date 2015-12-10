From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Dec 2015 21:52:01 +0100
Subject: [Buildroot] [git commit] linux-firmware: bump version
Message-ID: <20151210205359.EA9AD822E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0d6200752154c3cde6e6472e2485118c8ea4de00
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CXGB4 firmware files have been renamed upstream.

Signed-off-by: John Keeping <john@metanate.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/linux-firmware.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index d3efd65..da51d50 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 3161bfa479d5e9ed4f46b57df9bcecbbc4f8eb3c
+LINUX_FIRMWARE_VERSION = bbe4917c054eb0a73e250c6363341e3bf6725839
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
@@ -261,14 +261,14 @@ LINUX_FIRMWARE_FILES += \
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
 
