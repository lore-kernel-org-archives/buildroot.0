From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 22:39:02 +0200
Subject: [Buildroot] [PATCH v2 4/4] configs/imx6-sabresd: Bump U-Boot
 and kernel versions
In-Reply-To: <20191009170004.3542-4-festevam@gmail.com>
References: <20191009170004.3542-1-festevam@gmail.com>
 <20191009170004.3542-4-festevam@gmail.com>
Message-ID: <20191010223902.441e34b4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  9 Oct 2019 14:00:04 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Bump U-Boot to 2019.10 and kernel to 5.3.4 version.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - None
> 
>  configs/imx6-sabresd_defconfig     | 8 ++++----
>  configs/imx6-sabresd_qt5_defconfig | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/configs/imx6-sabresd_defconfig b/configs/imx6-sabresd_defconfig
> index c2924b2e39..0d070e47f8 100644
> --- a/configs/imx6-sabresd_defconfig
> +++ b/configs/imx6-sabresd_defconfig
> @@ -4,8 +4,8 @@ BR2_ARM_ENABLE_NEON=y
>  BR2_ARM_ENABLE_VFP=y
>  BR2_ARM_FPU_VFPV3=y
>  
> -# Linux headers same as kernel, a 4.19 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
> +# Linux headers same as kernel, a 5.3 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
>  
>  # System
>  BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
> @@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BOARDNAME="mx6sabresd"
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
>  BR2_TARGET_UBOOT_FORMAT_IMG=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="SPL"
> @@ -32,7 +32,7 @@ BR2_TARGET_UBOOT_SPL_NAME="SPL"
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.4"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
> diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
> index 887e53dc21..7a541951ae 100644
> --- a/configs/imx6-sabresd_qt5_defconfig
> +++ b/configs/imx6-sabresd_qt5_defconfig
> @@ -4,8 +4,8 @@ BR2_ARM_ENABLE_NEON=y
>  BR2_ARM_ENABLE_VFP=y
>  BR2_ARM_FPU_VFPV3=y
>  
> -# Linux headers same as kernel, a 4.19 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
> +# Linux headers same as kernel, a 5.3 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
>  
>  # Additional features needed for packages
>  BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> @@ -30,7 +30,7 @@ BR2_ROOTFS_OVERLAY="board/freescale/imx6-sabresd/rootfs_overlay"
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BOARDNAME="mx6sabresd"
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
>  BR2_TARGET_UBOOT_FORMAT_IMG=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="SPL"
> @@ -38,7 +38,7 @@ BR2_TARGET_UBOOT_SPL_NAME="SPL"
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.4"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"



-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
