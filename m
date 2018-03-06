From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Mar 2018 15:27:26 +0100
Subject: [Buildroot] [git commit] configs/snps_archs38_axs103: needs
 host-openssl for the Linux kernel build
Message-ID: <20180306143235.B990E80DEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc575cf9de36750f76a232493508f63c3c18979e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306944

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
