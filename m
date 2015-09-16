From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Sep 2015 23:59:01 +0200
Subject: [Buildroot] [git commit] configs/ci20: add u-boot version 2013.10
	(2015-09-15)
Message-ID: <20150916215915.DE3E57FBCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da8e4ce8443bef94252929bb4631b6b130d175c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: David du Colombier <0intro@gmail.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/ci20_defconfig |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
index ec814ba..e87181a 100644
--- a/configs/ci20_defconfig
+++ b/configs/ci20_defconfig
@@ -15,3 +15,15 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/MIPS/CI20_linux.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="93b4df0786f07643eb61daee8934a3f3a05fd280"
 BR2_LINUX_KERNEL_DEFCONFIG="ci20"
+
+# u-boot
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y
+BR2_TARGET_UBOOT_BOARDNAME="ci20_mmc"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/MIPS/CI20_u-boot"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="a4f583551d0025eb957ee5c9cb68657a429e4914"
+BR2_TARGET_UBOOT_VERSION="a4f583551d0025eb957ee5c9cb68657a429e4914"
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin"
