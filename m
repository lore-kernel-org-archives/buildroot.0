From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Mar 2016 23:01:18 +0100
Subject: [Buildroot] [git commit] uboot: indentation cleanup
Message-ID: <20160309220856.D03677F8D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24ba69015cc6a2431c9cdb16288dc19ec23a52a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
