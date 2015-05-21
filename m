From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Date: Thu, 21 May 2015 11:10:09 +0200
Subject: [Buildroot] [PATCH] imx6sabre: refresh u-boot patch
In-Reply-To: <1432116744-25760-13-git-send-email-gary.bisson@boundarydevices.com>
References: <1432116744-25760-13-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1432199409-18909-1-git-send-email-vincent.stehle@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After bump to version to 3.10.53-1.1.0 GA.

Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
Cc: Gary Bisson <gary.bisson@boundarydevices.com>
---

Hi,

Thank you Gary for updating the Freescale "components" versions in
buildroot.

I am testing a bit your patch queue and I needed to update one patch for
proper build of u-boot with freescale_imx6qsabresd_defconfig.

Best regards,

V.

 ...abre_common-boot-Linux-to-init-in-mfgtools-mode.patch | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/board/freescale/imx6sabre/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch b/board/freescale/imx6sabre/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
index c01df4e..9e2aebf 100644
--- a/board/freescale/imx6sabre/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
+++ b/board/freescale/imx6sabre/patches/uboot/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch
@@ -1,4 +1,4 @@
-From 4a7cd7c5b165317dccf45cfc235da3e14bc339e8 Mon Sep 17 00:00:00 2001
+From 90ecc0ad14337898b75843efc6530fc4a34f7808 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
 Date: Tue, 12 Aug 2014 10:17:31 +0200
 Subject: [PATCH] mx6qsabre_common: boot Linux to /init in mfgtools mode
@@ -15,14 +15,14 @@ buildroot system entirely through USB.
 
 Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
 ---
- include/configs/mx6qsabre_common.h | 2 +-
+ include/configs/mx6sabre_common.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/include/configs/mx6qsabre_common.h b/include/configs/mx6qsabre_common.h
-index 69ff0df..ec7b665 100644
---- a/include/configs/mx6qsabre_common.h
-+++ b/include/configs/mx6qsabre_common.h
-@@ -129,7 +129,7 @@
+diff --git a/include/configs/mx6sabre_common.h b/include/configs/mx6sabre_common.h
+index 93d4c4b..d2e7efd 100644
+--- a/include/configs/mx6sabre_common.h
++++ b/include/configs/mx6sabre_common.h
+@@ -106,7 +106,7 @@
  
  #define CONFIG_MFG_ENV_SETTINGS \
  	"mfgtool_args=setenv bootargs console=" CONFIG_CONSOLE_DEV ",115200 " \
@@ -32,5 +32,5 @@ index 69ff0df..ec7b665 100644
  		"g_mass_storage.idVendor=0x066F g_mass_storage.idProduct=0x37FF "\
  		"g_mass_storage.iSerialNumber=\"\" "\
 -- 
-2.0.1
+2.1.4
 
-- 
2.1.4
