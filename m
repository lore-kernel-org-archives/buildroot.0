From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  4 Mar 2018 22:31:22 +0100
Subject: [Buildroot] [PATCH 08/23] configs/snps_archs38_axs103: needs
 host-openssl for the Linux kernel build
In-Reply-To: <20180304213137.24681-1-thomas.petazzoni@bootlin.com>
References: <20180304213137.24681-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180304213137.24681-9-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306944

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/snps_archs38_axs103_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/snps_archs38_axs103_defconfig b/configs/snps_archs38_axs103_defconfig
index 42a4feaba8..39ceeae433 100644
--- a/configs/snps_archs38_axs103_defconfig
+++ b/configs/snps_archs38_axs103_defconfig
@@ -17,6 +17,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
 BR2_LINUX_KERNEL_DEFCONFIG="axs103_smp"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
-- 
2.14.3
