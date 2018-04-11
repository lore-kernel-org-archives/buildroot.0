From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Wed, 11 Apr 2018 18:28:45 +0200
Subject: [Buildroot] [PATCH 1/2] configs/chiliboard: Bump U-Boot to 2018.03
Message-ID: <20180411162846.19845-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 configs/grinn_chiliboard_defconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/configs/grinn_chiliboard_defconfig b/configs/grinn_chiliboard_defconfig
index cfd22b8221..080f7ae1bf 100644
--- a/configs/grinn_chiliboard_defconfig
+++ b/configs/grinn_chiliboard_defconfig
@@ -14,9 +14,8 @@ BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="http://git.denx.de/u-boot.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="aac477eca88dd81b18b48573ababee5112d571f3"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.03"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="chiliboard"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-- 
2.17.0
