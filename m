From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 22:33:08 +0200
Subject: [Buildroot] [git commit master 1/1] u-boot: remove u-boot-status
	make target
Message-ID: <20100614203435.CCA8C80E24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=86074e71b6a0933afcd88b0ccdd3d7cccd2779fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/u-boot/u-boot.mk |   15 ---------------
 1 files changed, 0 insertions(+), 15 deletions(-)

diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index 7e98ca8..466d4a0 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -276,18 +276,3 @@ $(error NO U-Boot board name set. Check your BR2_TARGET_UBOOT_BOARDNAME setting)
 endif
 
 endif
-
-u-boot-status:
-	@echo
-	@echo U_BOOT_INC_CONF_FILE = $(U_BOOT_INC_CONF_FILE)
-	@echo BR2_UBOOT_VERSION = $(BR2_UBOOT_VERSION)
-	@echo BR2_TARGET_UBOOT_SERVERIP = $(BR2_TARGET_UBOOT_SERVERIP)
-	@echo BR2_TARGET_UBOOT_IPADDR = $(BR2_TARGET_UBOOT_IPADDR)
-	@echo BR2_TARGET_UBOOT_GATEWAY = $(BR2_TARGET_UBOOT_GATEWAY)
-	@echo BR2_TARGET_UBOOT_NETMASK = $(BR2_TARGET_UBOOT_NETMASK)
-	@echo BR2_TARGET_UBOOT_ETH0ADDR = $(BR2_TARGET_UBOOT_ETHADDR)
-	@echo BR2_TARGET_UBOOT_ETH1ADDR = $(BR2_TARGET_UBOOT_ETH1ADDR)
-	@echo BR2_TARGET_UBOOT_SILENT = $(BR2_TARGET_UBOOT_SILENT)
-	@echo UBOOT_BOARD_NAME=$(UBOOT_BOARD_NAME)
-	@exit 0
-
-- 
1.7.1
