From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 May 2019 11:59:57 +0200
Subject: [Buildroot] [git commit] configs/orangepi_pc2: kernel needs
 host-openssl to build
Message-ID: <20190512095441.5111188817@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bd8d57c440e00a730403a027c63358f595b7256
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/210208607

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/orangepi_pc2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/orangepi_pc2_defconfig b/configs/orangepi_pc2_defconfig
index cd02b46e34..864f8bb8a2 100644
--- a/configs/orangepi_pc2_defconfig
+++ b/configs/orangepi_pc2_defconfig
@@ -36,6 +36,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.0"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun50i-h5-orangepi-pc2"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Filesystem
 BR2_TARGET_GENERIC_ISSUE="Welcome to Orangepi PC2"
