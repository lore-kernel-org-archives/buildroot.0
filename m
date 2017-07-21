From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 22:47:19 +0200
Subject: [Buildroot] [git commit] configs/bananapro: bump U-Boot to version
	2017.07
Message-ID: <20170721204322.C279482148@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ddd41f231861bb28cfd56be55f7647fde3dd93d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note, that since version 2017.07 the sunxi targets needs the Python
libfdt library on the host. Therefore, additionally select the U-Boot
config option BR2_TARGET_UBOOT_NEEDS_PYLIBFDT.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/bananapro_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configs/bananapro_defconfig b/configs/bananapro_defconfig
index d3768bf..538e3e2 100644
--- a/configs/bananapro_defconfig
+++ b/configs/bananapro_defconfig
@@ -39,9 +39,10 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.03"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Bananapro"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
