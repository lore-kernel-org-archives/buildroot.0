From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Apr 2019 09:17:26 +0200
Subject: [Buildroot] [git commit] configs: friendlyarm_nanopi_a64: Bump to
 u-boot version 2019.01
Message-ID: <20190407071706.669D78D676@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6da09e49eeacf69900a5a67663bf48f22f63feb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/friendlyarm_nanopi_a64_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/friendlyarm_nanopi_a64_defconfig b/configs/friendlyarm_nanopi_a64_defconfig
index 9a0021b425..7df1d9399c 100644
--- a/configs/friendlyarm_nanopi_a64_defconfig
+++ b/configs/friendlyarm_nanopi_a64_defconfig
@@ -17,7 +17,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_a64"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
