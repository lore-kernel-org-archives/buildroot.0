From: Jagan Teki <jagan@openedev.com>
Date: Tue, 14 Mar 2017 16:31:05 +0530
Subject: [Buildroot] [PATCH 1/2] uboot: Config.in: Update
	BR2_TARGET_UBOOT_SPL_NAME help text
Message-ID: <1489489266-23161-1-git-send-email-jagan@openedev.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jagan Teki <jagan@amarulasolutions.com>

SPL is the name used for spl on i.MX6, so update the
same on BR2_TARGET_UBOOT_SPL_NAME help text.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 boot/uboot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 7a73877..571c9b1 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -328,7 +328,7 @@ config BR2_TARGET_UBOOT_SPL_NAME
 	help
 	  A space-separated list of SPL binaries, generated during
 	  u-boot build. For most platform it is spl/u-boot-spl.bin
-	  but not always. It is MLO on OMAP for example.
+	  but not always. It is MLO on OMAP and SPL on i.MX6 for example.
 
 config BR2_TARGET_UBOOT_ZYNQ_IMAGE
 	bool "Generate image for Xilinx Zynq"
-- 
1.9.1
