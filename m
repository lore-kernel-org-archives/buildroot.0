From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 00:44:10 +0200
Subject: [Buildroot] [PATCH 1/1] configs/freescale_imx8mmevk_defconfig:
 bump to 4.14.98_2.0.0
In-Reply-To: <20190731144252.22395-1-mark.corbin@embecosm.com> (Mark Corbin's
 message of "Wed, 31 Jul 2019 15:42:52 +0100")
References: <20190731144252.22395-1-mark.corbin@embecosm.com>
Message-ID: <8736il7rk5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mark" == Mark Corbin <mark.corbin@embecosm.com> writes:

 > Update the i.MX8MM-EVK BSP to match the latest version
 > referenced on the NXP website.

 > Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>

Committed, thanks.

> ---
 >  configs/freescale_imx8mmevk_defconfig | 6 +++---
 >  1 file changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/configs/freescale_imx8mmevk_defconfig b/configs/freescale_imx8mmevk_defconfig
 > index 1acb3a694b..5472ed36bd 100644
 > --- a/configs/freescale_imx8mmevk_defconfig
 > +++ b/configs/freescale_imx8mmevk_defconfig
 > @@ -7,7 +7,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/fsl-imx8mm-evk.dtb"
 >  BR2_LINUX_KERNEL=y
 >  BR2_LINUX_KERNEL_CUSTOM_GIT=y
 >  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx"
 > -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.14.78_1.0.0_ga"
 > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.14.98_2.0.0_ga"
 >  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
 >  BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-imx8mm-evk"
 > @@ -20,14 +20,14 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 >  BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
 >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/imx-atf"
 > -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_4.14.78_1.0.0_ga"
 > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="rel_imx_4.14.98_2.0.0_ga"
 >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
 >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 >  BR2_TARGET_UBOOT=y
 >  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 >  BR2_TARGET_UBOOT_CUSTOM_GIT=y
 >  BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx"
 > -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.14.78_1.0.0_ga"
 > +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.14.98_2.0.0_ga"
 >  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mm_evk"
 >  BR2_TARGET_UBOOT_NEEDS_DTC=y
 >  BR2_TARGET_UBOOT_FORMAT_IMX=y
 > -- 
 > 2.19.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
