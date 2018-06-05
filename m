From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 18:46:05 +0200
Subject: [Buildroot] [git commit] configs/arcturus_ucls1012a: bump U-Boot
 version
Message-ID: <20180605164448.69B4183890@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4cfdd0faa0c13fab5ec12ee5263d6f30e781d66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This new u-boot custom repo version should fix the
arcturus_ucls1012a_defconfig build failures on master.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/71726827

Signed-off-by: Oleksandr Zhadan <oleks@arcturusnetworks.com>
Signed-off-by: Michael Durrant <mdurrant@arcturusnetworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/arcturus_ucls1012a_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arcturus_ucls1012a_defconfig b/configs/arcturus_ucls1012a_defconfig
index 9d1da8c2cc..7fb980479a 100644
--- a/configs/arcturus_ucls1012a_defconfig
+++ b/configs/arcturus_ucls1012a_defconfig
@@ -28,7 +28,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/ArcturusNetworks/uCLS1012A-uboot.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v0.2.1811"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v0.2.1823"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="UCLS1012A_QSPI128"
 
 # Tools
