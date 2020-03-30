From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Mon, 30 Mar 2020 19:22:59 +0200
Subject: [Buildroot] [PATCH v2 2/4] nanpi_neo4_config: Enable
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN option
In-Reply-To: <1585588981-12498-1-git-send-email-marek.belisko@open-nandra.com>
References: <1585588981-12498-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <1585588981-12498-3-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With this option enabled AFT to neo4 will be build without issues.
For more details see commit: 8af7b11bd8a95bc41e4de46f727f3b0afde465a4 and
d9959b647f2afd09e564bddfc3d21476f9a0f669

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 configs/nanopi_neo4_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/nanopi_neo4_defconfig b/configs/nanopi_neo4_defconfig
index 0e58aea..2bffe66 100644
--- a/configs/nanopi_neo4_defconfig
+++ b/configs/nanopi_neo4_defconfig
@@ -11,6 +11,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/ARM-software/arm-trusted-firmware"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="v2.0"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="rk3399"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_ARM32_TOOLCHAIN=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
 # Bootloader
-- 
2.7.4
