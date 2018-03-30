From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 19:05:21 +0200
Subject: [Buildroot] [git commit branch/2018.02.x]
 configs/solidrun_macchiatobin_mainline: needs host-openssl for the Linux
 kernel build
Message-ID: <20180330193202.601877FF3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c22be4afd42998571b029f80fc6011729509740
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306948

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ddbfee735e9bf13ebe6bec28790d18579ec37837)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/solidrun_macchiatobin_mainline_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/solidrun_macchiatobin_mainline_defconfig b/configs/solidrun_macchiatobin_mainline_defconfig
index 526c021fe7..dd797d709c 100644
--- a/configs/solidrun_macchiatobin_mainline_defconfig
+++ b/configs/solidrun_macchiatobin_mainline_defconfig
@@ -31,6 +31,7 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-8040-mcbin"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/solidrun/macchiatobin/linux-extras.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # rootfs
 BR2_TARGET_ROOTFS_TAR=y
