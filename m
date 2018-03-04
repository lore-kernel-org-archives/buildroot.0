From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  4 Mar 2018 22:31:26 +0100
Subject: [Buildroot] [PATCH 12/23] configs/snps_arc700_axs101: needs
 host-openssl for the Linux kernel build
In-Reply-To: <20180304213137.24681-1-thomas.petazzoni@bootlin.com>
References: <20180304213137.24681-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180304213137.24681-13-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306943

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/snps_arc700_axs101_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/snps_arc700_axs101_defconfig b/configs/snps_arc700_axs101_defconfig
index daa8ebb8f0..0fefaf4aa8 100644
--- a/configs/snps_arc700_axs101_defconfig
+++ b/configs/snps_arc700_axs101_defconfig
@@ -16,6 +16,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
 BR2_LINUX_KERNEL_DEFCONFIG="axs101"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
-- 
2.14.3
