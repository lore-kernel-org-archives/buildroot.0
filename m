From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Aug 2017 22:10:12 +0200
Subject: [Buildroot] [git commit] socrates_cyclone5_defconfig: U-Boot needs
	DTC
Message-ID: <20170814200408.D14F48211E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ac915e207270ca51c0c1aea9ec7d3e2c74be6eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Probably not noticed before because dtc was already built or it was
installed on the host.

Fixes: https://gitlab.com/arnout/buildroot/-/jobs/28979369

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Micha?? ??yszczek <michal.lyszczek@bofc.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/socrates_cyclone5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/socrates_cyclone5_defconfig b/configs/socrates_cyclone5_defconfig
index 5793458..45355c1 100644
--- a/configs/socrates_cyclone5_defconfig
+++ b/configs/socrates_cyclone5_defconfig
@@ -21,6 +21,7 @@ BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/altera-opensource/u-boot-socfpga.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2017.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="socfpga_socrates"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC=y
