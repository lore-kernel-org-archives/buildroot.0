Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CBEC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 09:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9D1F60AC3;
	Wed, 29 Dec 2021 09:13:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wd_bnG1sytS1; Wed, 29 Dec 2021 09:13:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBD1960B60;
	Wed, 29 Dec 2021 09:13:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 295E91BF4E7
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17C9E8198A
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:13:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UsVdWHBhBqOO for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 09:13:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEB59818EC
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 09:13:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B2D4382BCF; Wed, 29 Dec 2021 09:07:49 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 10:13:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aed7e58219b25371eb6997b50e983f6d41f29e85
X-Git-Newrev: 88c60dbe91a7193f888d01e73f4fe0aa3e8d5d57
X-Patchwork-Hint: ignore
Message-Id: <20211229090749.B2D4382BCF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/{microchip,
 atmel}: bump at91bootstrap to 4.0.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=88c60dbe91a7193f888d01e73f4fe0aa3e8d5d57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the AT91BOOTSTRAP bootloader package to new released version 4.0.1
for all the supported boards (SAMA boards + SAM9X60).

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig       | 2 +-
 configs/atmel_sama5d2_xplained_mmc_defconfig           | 2 +-
 configs/atmel_sama5d2_xplained_mmc_dev_defconfig       | 2 +-
 configs/atmel_sama5d3_xplained_defconfig               | 2 +-
 configs/atmel_sama5d3_xplained_dev_defconfig           | 2 +-
 configs/atmel_sama5d3_xplained_mmc_defconfig           | 2 +-
 configs/atmel_sama5d3_xplained_mmc_dev_defconfig       | 2 +-
 configs/atmel_sama5d4_xplained_defconfig               | 2 +-
 configs/atmel_sama5d4_xplained_dev_defconfig           | 2 +-
 configs/atmel_sama5d4_xplained_mmc_defconfig           | 2 +-
 configs/atmel_sama5d4_xplained_mmc_dev_defconfig       | 2 +-
 configs/microchip_sam9x60ek_mmc_defconfig              | 2 +-
 configs/microchip_sam9x60ek_mmc_dev_defconfig          | 2 +-
 configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig     | 2 +-
 configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig | 2 +-
 configs/microchip_sama5d2_icp_mmc_defconfig            | 2 +-
 configs/microchip_sama5d2_icp_mmc_dev_defconfig        | 2 +-
 configs/microchip_sama7g5ek_mmc_defconfig              | 2 +-
 configs/microchip_sama7g5ek_mmc_dev_defconfig          | 2 +-
 19 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
index ba9b61936b..ba2fa46790 100644
--- a/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
+++ b/configs/atmel_sama5d27_som1_ek_mmc_dev_defconfig
@@ -71,7 +71,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.10.3)/at91bootstrap3-v3.10.3.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.1)/at91bootstrap3-v4.0.1.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d27_som1_eksd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/atmel_sama5d2_xplained_mmc_defconfig b/configs/atmel_sama5d2_xplained_mmc_defconfig
index 3b21e7a56d..5b63812606 100644
--- a/configs/atmel_sama5d2_xplained_mmc_defconfig
+++ b/configs/atmel_sama5d2_xplained_mmc_defconfig
@@ -17,7 +17,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.10.3)/at91bootstrap3-v3.10.3.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.1)/at91bootstrap3-v4.0.1.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d2_xplainedsd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
index 843c033cf5..a8b68ca0a2 100644
--- a/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d2_xplained_mmc_dev_defconfig
@@ -88,7 +88,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.10.3)/at91bootstrap3-v3.10.3.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.1)/at91bootstrap3-v4.0.1.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d2_xplainedsd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/atmel_sama5d3_xplained_defconfig b/configs/atmel_sama5d3_xplained_defconfig
index 83390f41ef..7ef45db469 100644
--- a/configs/atmel_sama5d3_xplained_defconfig
+++ b/configs/atmel_sama5d3_xplained_defconfig
@@ -16,7 +16,7 @@ BR2_TARGET_ROOTFS_UBI=y
 BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.10.3)/at91bootstrap3-v3.10.3.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.1)/at91bootstrap3-v4.0.1.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3_xplainednf_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/atmel_sama5d3_xplained_dev_defconfig b/configs/atmel_sama5d3_xplained_dev_defconfig
index 720ed57e25..cdfd9de17e 100644
--- a/configs/atmel_sama5d3_xplained_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_dev_defconfig
@@ -85,7 +85,7 @@ BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
 # Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.10.3)/at91bootstrap3-v3.10.3.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.1)/at91bootstrap3-v4.0.1.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3_xplainednf_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/atmel_sama5d3_xplained_mmc_defconfig b/configs/atmel_sama5d3_xplained_mmc_defconfig
index 068b5d443b..1b7d269887 100644
--- a/configs/atmel_sama5d3_xplained_mmc_defconfig
+++ b/configs/atmel_sama5d3_xplained_mmc_defconfig
@@ -16,7 +16,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.10.3)/at91bootstrap3-v3.10.3.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.1)/at91bootstrap3-v4.0.1.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3_xplainedsd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
index a530c7d9f6..a2205aeefa 100644
--- a/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d3_xplained_mmc_dev_defconfig
@@ -87,7 +87,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.10.3)/at91bootstrap3-v3.10.3.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.1)/at91bootstrap3-v4.0.1.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3_xplainedsd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/atmel_sama5d4_xplained_defconfig b/configs/atmel_sama5d4_xplained_defconfig
index 82da11f392..c0b606bc9a 100644
--- a/configs/atmel_sama5d4_xplained_defconfig
+++ b/configs/atmel_sama5d4_xplained_defconfig
@@ -20,7 +20,7 @@ BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x40000
 BR2_TARGET_ROOTFS_UBI_SUBSIZE=0
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.10.3)/at91bootstrap3-v3.10.3.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.1)/at91bootstrap3-v4.0.1.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d4_xplainednf_uboot_secure"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/atmel_sama5d4_xplained_dev_defconfig b/configs/atmel_sama5d4_xplained_dev_defconfig
index 5a4bec344d..f8783f5652 100644
--- a/configs/atmel_sama5d4_xplained_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_dev_defconfig
@@ -89,7 +89,7 @@ BR2_TARGET_ROOTFS_UBI_SUBSIZE=0
 # Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.10.3)/at91bootstrap3-v3.10.3.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.1)/at91bootstrap3-v4.0.1.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d4_xplainednf_uboot_secure"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/atmel_sama5d4_xplained_mmc_defconfig b/configs/atmel_sama5d4_xplained_mmc_defconfig
index 52905c82ef..ff01073205 100644
--- a/configs/atmel_sama5d4_xplained_mmc_defconfig
+++ b/configs/atmel_sama5d4_xplained_mmc_defconfig
@@ -17,7 +17,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.10.3)/at91bootstrap3-v3.10.3.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.1)/at91bootstrap3-v4.0.1.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d4_xplainedsd_uboot_secure"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
index 565ff06900..b4e99f658a 100644
--- a/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
+++ b/configs/atmel_sama5d4_xplained_mmc_dev_defconfig
@@ -88,7 +88,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # Bootloaders
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.10.3)/at91bootstrap3-v3.10.3.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.1)/at91bootstrap3-v4.0.1.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d4_xplainedsd_uboot_secure"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/microchip_sam9x60ek_mmc_defconfig b/configs/microchip_sam9x60ek_mmc_defconfig
index 8b1c3feb55..7a1a699d2e 100644
--- a/configs/microchip_sam9x60ek_mmc_defconfig
+++ b/configs/microchip_sam9x60ek_mmc_defconfig
@@ -14,7 +14,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.10.3)/at91bootstrap-v3.10.3.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.1)/at91bootstrap-v4.0.1.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sam9x60eksd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/microchip_sam9x60ek_mmc_dev_defconfig b/configs/microchip_sam9x60ek_mmc_dev_defconfig
index 20b5dbb9f9..da1bd33dd3 100644
--- a/configs/microchip_sam9x60ek_mmc_dev_defconfig
+++ b/configs/microchip_sam9x60ek_mmc_dev_defconfig
@@ -68,7 +68,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.10.3)/at91bootstrap-v3.10.3.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.1)/at91bootstrap-v4.0.1.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sam9x60eksd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig b/configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig
index f49068584b..024e8a1465 100644
--- a/configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig
+++ b/configs/microchip_sama5d27_wlsom1_ek_mmc_defconfig
@@ -17,7 +17,7 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.10.3)/at91bootstrap-v3.10.3.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.1)/at91bootstrap-v4.0.1.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d27_wlsom1_eksd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig b/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
index 555e823263..3bcd5f0200 100644
--- a/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
+++ b/configs/microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig
@@ -72,7 +72,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v3.10.3)/at91bootstrap-v3.10.3.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.1)/at91bootstrap-v4.0.1.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d27_wlsom1_eksd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/microchip_sama5d2_icp_mmc_defconfig b/configs/microchip_sama5d2_icp_mmc_defconfig
index 5b7080dbb8..4bb3625f83 100644
--- a/configs/microchip_sama5d2_icp_mmc_defconfig
+++ b/configs/microchip_sama5d2_icp_mmc_defconfig
@@ -17,7 +17,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.0)/at91bootstrap-v4.0.0.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.1)/at91bootstrap-v4.0.1.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d2_icpsd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/microchip_sama5d2_icp_mmc_dev_defconfig b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
index 84a0b1b375..052d9e032c 100644
--- a/configs/microchip_sama5d2_icp_mmc_dev_defconfig
+++ b/configs/microchip_sama5d2_icp_mmc_dev_defconfig
@@ -60,7 +60,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.0)/at91bootstrap-v4.0.0.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.1)/at91bootstrap-v4.0.1.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d2_icpsd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/microchip_sama7g5ek_mmc_defconfig b/configs/microchip_sama7g5ek_mmc_defconfig
index 940b658c7d..b1cd193829 100644
--- a/configs/microchip_sama7g5ek_mmc_defconfig
+++ b/configs/microchip_sama7g5ek_mmc_defconfig
@@ -12,7 +12,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.0)/at91bootstrap-v4.0.0.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.1)/at91bootstrap-v4.0.1.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama7g5eksd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
diff --git a/configs/microchip_sama7g5ek_mmc_dev_defconfig b/configs/microchip_sama7g5ek_mmc_dev_defconfig
index e7f2f9ca83..3253bce401 100644
--- a/configs/microchip_sama7g5ek_mmc_dev_defconfig
+++ b/configs/microchip_sama7g5ek_mmc_dev_defconfig
@@ -55,7 +55,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_AT91BOOTSTRAP3=y
 BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
-BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.0)/at91bootstrap-v4.0.0.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.1)/at91bootstrap-v4.0.1.tar.gz"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama7g5eksd_uboot"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
