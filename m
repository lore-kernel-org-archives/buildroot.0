From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 11:07:12 +0200
Subject: [Buildroot] [git commit] altera: update use of
	BR2_TARGET_UBOOT_PATCH_DIR
Message-ID: <20150419090719.57600819C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e66b9905dd7bd355560235197e5f31d1d6197bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use BR2_TARGET_UBOOT_PATCH now that BR2_TARGET_UBOOT_PATCH_DIR is
deprecated.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/altera_sockit_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/altera_sockit_defconfig b/configs/altera_sockit_defconfig
index d27b96b..888fccf 100644
--- a/configs/altera_sockit_defconfig
+++ b/configs/altera_sockit_defconfig
@@ -31,7 +31,7 @@ BR2_TARGET_UBOOT_BOARDNAME="socfpga_cyclone5"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.rocketboards.org/u-boot-socfpga.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_acds13.0sp1"
-BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="board/altera/sockit"
+BR2_TARGET_UBOOT_PATCH="board/altera/sockit"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin"
