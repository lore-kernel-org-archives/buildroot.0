From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed,  9 Mar 2016 22:30:32 +0100
Subject: [Buildroot] [PATCH 5/5] uboot: indentation cleanup
In-Reply-To: <1457559032-3384-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1457559032-3384-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1457559032-3384-5-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 boot/uboot/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index dde4710..4a6dc56 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -332,11 +332,11 @@ config BR2_TARGET_UBOOT_ZYNQ_IMAGE
 	depends on BR2_TARGET_UBOOT_SPL
 	depends on BR2_TARGET_UBOOT_FORMAT_DTB_IMG
 	help
-	 Generate the BOOT.BIN file from U-Boot's SPL. The image
-	 boots the Xilinx Zynq chip without any FPGA bitstream.
-	 A bitstream can be loaded by the U-Boot. The SPL searchs
-	 for u-boot-dtb.img file so this U-Boot format is required
-	 to be set.
+	  Generate the BOOT.BIN file from U-Boot's SPL. The image
+	  boots the Xilinx Zynq chip without any FPGA bitstream.
+	  A bitstream can be loaded by the U-Boot. The SPL searchs
+	  for u-boot-dtb.img file so this U-Boot format is required
+	  to be set.
 
 menuconfig BR2_TARGET_UBOOT_ENVIMAGE
 	bool "Environment image"
-- 
1.9.1
