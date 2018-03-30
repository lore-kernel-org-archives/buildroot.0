From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 19:02:43 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] configs/snps_archs38_vdk:
 needs host-openssl for the Linux kernel build
Message-ID: <20180330193201.DA29683D1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4515f0580f06814a522ac3553f682f43b75306b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/55306946

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 53f0ffe34a05394e4135c81ca2622be5b8741c79)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/snps_archs38_vdk_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/snps_archs38_vdk_defconfig b/configs/snps_archs38_vdk_defconfig
index 434ed37a9e..46b539beec 100644
--- a/configs/snps_archs38_vdk_defconfig
+++ b/configs/snps_archs38_vdk_defconfig
@@ -17,3 +17,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
 BR2_LINUX_KERNEL_DEFCONFIG="vdk_hs38_smp"
 BR2_LINUX_KERNEL_VMLINUX=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
