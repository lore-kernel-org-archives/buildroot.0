From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Oct 2017 23:11:58 +0200
Subject: [Buildroot] [git commit] odroidc2_defconfig: bump kernel and u-boot
	versions
Message-ID: <20171007210437.DAD9B8112E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae531565f00df88ae545fc37204bb81249dd40f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To the latest commits on the odroidc2-3.14.y / odroidc2-v2015.01 branches.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Dagg <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/odroidc2_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index f2d8229..f52f29a 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -16,7 +16,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/hardkernel/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="a7fe6f2258e30c7a547908b5480bdbe6b56d6d3c"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="f966ebfc0e8dc88c7931b4640b8a1b4bc2e13faa"
 BR2_LINUX_KERNEL_DEFCONFIG="odroidc2"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_BUILD_DEFAULT_DTS=y
@@ -28,7 +28,7 @@ BR2_LINUX_KERNEL_IMAGE=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/hardkernel/u-boot.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="eb5d2d16fd45f52ec49e9b4ff9d562630c08e61c"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="cff3edb675933ea2e2ecd659eab127a42f3777df"
 BR2_TARGET_UBOOT_BOARDNAME="odroidc2"
 
 # Required tools to create the SD image
