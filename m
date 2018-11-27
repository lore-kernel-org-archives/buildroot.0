From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Nov 2018 09:08:40 +0100
Subject: [Buildroot] [PATCH 3/3] configs/orangepi_zero_plus2: needs
 host-openssl to build Linux
In-Reply-To: <20181127080840.19434-1-thomas.petazzoni@bootlin.com>
References: <20181127080840.19434-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181127080840.19434-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/125631911

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
-- 
2.19.1
