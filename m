From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 19:06:23 +0200
Subject: [Buildroot] [git commit branch/2018.02.x]
 configs/solidrun_macchiatobin_marvell: U-Boot needs host-dtc
Message-ID: <20180330193202.7E0C0816A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11cb4976b0f30b05d50af9749443ba1c16b221ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306949

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d329ec701e1c78171528139c0c6757cdca18e94d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/solidrun_macchiatobin_marvell_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/solidrun_macchiatobin_marvell_defconfig b/configs/solidrun_macchiatobin_marvell_defconfig
index 1e747c344a..5489136e1c 100644
--- a/configs/solidrun_macchiatobin_marvell_defconfig
+++ b/configs/solidrun_macchiatobin_marvell_defconfig
@@ -22,6 +22,7 @@ BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/MarvellEmbeddedProcessors/u-boot-marvell"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="u-boot-2017.03-armada-17.10"
 BR2_TARGET_UBOOT_BOARDNAME="mvebu_mcbin-88f8040"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
