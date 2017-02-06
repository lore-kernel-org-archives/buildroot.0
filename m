From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:55 -0500
Subject: [Buildroot] [PATCH 42/44] linux-firmware: t4fw bump to version
	1.16.26.0
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-43-aduskett@codeblue.com>
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
index d8b1729..fc1ff7b 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -473,8 +473,8 @@ LINUX_FIRMWARE_DIRS += tigon
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T4),y)
-# cxgb4/t4fw.bin is a symlink to cxgb4/t4fw-1.14.4.0.bin
-LINUX_FIRMWARE_FILES += cxgb4/t4fw-1.14.4.0.bin cxgb4/t4fw.bin
+# cxgb4/t4fw.bin is a symlink to cxgb4/t4fw-1.16.26.0.bin
+LINUX_FIRMWARE_FILES += cxgb4/t4fw-1.16.26.0.bin cxgb4/t4fw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
-- 
2.9.3
