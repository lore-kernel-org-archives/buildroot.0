From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Dec 2018 22:44:51 +0100
Subject: [Buildroot] [git commit branch/2018.08.x]
 configs/orangepi_zero_plus2: needs host-openssl to build Linux
Message-ID: <20181203215204.0B8658A5C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=692e5af5920749d77ac899bb6f46838ddfa3b56f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/125631911

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 35f6b2b24e86a59372fe9ea1b5415fff99a8ae36)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/orangepi_zero_plus2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index 618104ff5e..917aa851dd 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -38,6 +38,7 @@ BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-zero-plus2"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-zero-plus2/linux-extras.config"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # wireless firmware
 BR2_PACKAGE_LINUX_FIRMWARE=y
