From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Jan 2012 19:53:27 +0100
Subject: [Buildroot] [git commit] configs: at91sam9g20dfc: use modern u-boot
	/ mainline linux
Message-ID: <20120102185501.BA6E98FF94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1c3efb52cd8a2fd98a95aed638ec3f822a73e6b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/at91sam9g20dfc_defconfig |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/configs/at91sam9g20dfc_defconfig b/configs/at91sam9g20dfc_defconfig
index 16fd023..4a4b09c 100644
--- a/configs/at91sam9g20dfc_defconfig
+++ b/configs/at91sam9g20dfc_defconfig
@@ -9,14 +9,12 @@ BR2_TARGET_AT91BOOTSTRAP_DATAFLASHCARD=y
 
 # Second stage bootloader
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="at91sam9g20ek"
-BR2_TARGET_UBOOT_2010_06=y
+BR2_TARGET_UBOOT_BOARDNAME="at91sam9g20ek_nandflash"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="2.6.33"
-BR2_LINUX_KERNEL_PATCH="http://maxim.org.za/AT91RM9200/2.6/2.6.33-at91.patch.gz"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.1.6"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="at91sam9g20ek"
 
