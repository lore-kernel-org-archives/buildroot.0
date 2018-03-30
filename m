From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 19:04:47 +0200
Subject: [Buildroot] [git commit branch/2018.02.x]
 configs/snps_arc700_axs101: needs host-openssl for the Linux kernel build
Message-ID: <20180330193202.4134583EC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=abe9c16a6f677d2b174d29491d5613febce1b924
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306943

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e929742b84651ffee8a81a1bfe014a0c9772ebf4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
