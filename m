From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:56 -0500
Subject: [Buildroot] [PATCH 43/44] linux-firmware: t5fw bump to version
	1.16.26.0
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-44-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/linux-firmware/linux-firmware.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index fc1ff7b..ce82fe9 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -479,8 +479,8 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T5),y)
-# cxgb4/t5fw.bin is a symlink to cxgb4/t5fw-1.14.4.0.bin
-LINUX_FIRMWARE_FILES += cxgb4/t5fw-1.14.4.0.bin cxgb4/t5fw.bin
+# cxgb4/t5fw.bin is a symlink to cxgb4/t5fw-1.16.26.0.bin
+LINUX_FIRMWARE_FILES += cxgb4/t5fw-1.16.26.0.bin cxgb4/t5fw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
-- 
2.9.3
