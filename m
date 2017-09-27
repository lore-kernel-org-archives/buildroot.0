From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Sep 2017 23:47:20 +0200
Subject: [Buildroot] [PATCH v3 1/6] engicam: imx6qdl_icore: Bump to
 latest Linux and uboot releases
In-Reply-To: <1505302931-17387-2-git-send-email-jteki@openedev.com>
References: <1505302931-17387-1-git-send-email-jteki@openedev.com>
 <1505302931-17387-2-git-send-email-jteki@openedev.com>
Message-ID: <2d24e1d1-b567-bd04-e546-f0e6847f3df0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-09-17 13:42, Jagan Teki wrote:
> From: Jagan Teki <jagan@amarulasolutions.com>
> 
> - Linux: 4.13
> - Uboot: 2017.07
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
> Changes for v3:
> - newly added
> 
>  configs/engicam_imx6qdl_icore_defconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/configs/engicam_imx6qdl_icore_defconfig b/configs/engicam_imx6qdl_icore_defconfig
> index 466d60c..03e65bd 100644
> --- a/configs/engicam_imx6qdl_icore_defconfig
> +++ b/configs/engicam_imx6qdl_icore_defconfig
> @@ -4,8 +4,8 @@ BR2_ARM_ENABLE_NEON=y
>  BR2_ARM_ENABLE_VFP=y
>  BR2_ARM_FPU_VFPV3=y
>  
> -# Linux headers same as kernel, a 4.11 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
> +# Linux headers same as kernel, a 4.13 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_13=y
>  
>  # System
>  BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
> @@ -14,7 +14,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07-rc1"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6qdl_icore_mmc"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> @@ -25,7 +25,7 @@ BR2_TARGET_UBOOT_SPL_NAME="SPL"
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11.5"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.13"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
>  BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
