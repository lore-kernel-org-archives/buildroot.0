From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Apr 2018 23:17:37 +0200
Subject: [Buildroot] [git commit branch/2018.02.x]
 configs/solidrun_macchiatobin_*: use a Git commit for ATF
Message-ID: <20180501073417.229E388285@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2caf8161cb789aa99bb3dbb2662d94ae7d10b8ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The version of the ARM Trusted Firmware from Marvell was a Git branch,
not a Git commit, leading to unreproducible results. So let's use a
Git commit instead, which is the latest available from the branch that
was previously used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by:  Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c0f8d166214d54cedd4b3d09bccf5bb59205e301)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/solidrun_macchiatobin_mainline_defconfig | 2 +-
 configs/solidrun_macchiatobin_marvell_defconfig  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/solidrun_macchiatobin_mainline_defconfig b/configs/solidrun_macchiatobin_mainline_defconfig
index dd797d709c..17fb9d02a2 100644
--- a/configs/solidrun_macchiatobin_mainline_defconfig
+++ b/configs/solidrun_macchiatobin_mainline_defconfig
@@ -7,7 +7,7 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for Marvell MacchiatoBin"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/atf-marvell.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="atf-v1.3-armada-17.10"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="43965481990fd92e9666cf9371a8cf478055ec7c"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0_mcbin"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
diff --git a/configs/solidrun_macchiatobin_marvell_defconfig b/configs/solidrun_macchiatobin_marvell_defconfig
index 5489136e1c..201562b9f9 100644
--- a/configs/solidrun_macchiatobin_marvell_defconfig
+++ b/configs/solidrun_macchiatobin_marvell_defconfig
@@ -7,7 +7,7 @@ BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for Marvell MacchiatoBin"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/atf-marvell.git"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="atf-v1.3-armada-17.10"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="43965481990fd92e9666cf9371a8cf478055ec7c"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="a80x0_mcbin"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
