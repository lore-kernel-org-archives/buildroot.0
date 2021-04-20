From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Apr 2021 22:10:20 +0200
Subject: [Buildroot] [PATCH] configs/imx6-sabresd: bump U-Boot and
 kernel versions
In-Reply-To: <20210420140106.1835734-1-festevam@gmail.com>
References: <20210420140106.1835734-1-festevam@gmail.com>
Message-ID: <20210420201020.GE298901@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2021-04-20 11:01 -0300, Fabio Estevam spake thusly:
> Bump to U-Boot 2021.04 and kernel 5.10.25 versions.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/imx6-sabresd_defconfig     | 4 ++--
>  configs/imx6-sabresd_qt5_defconfig | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/configs/imx6-sabresd_defconfig b/configs/imx6-sabresd_defconfig
> index c0dce1ce6217..5a39f333d1ac 100644
> --- a/configs/imx6-sabresd_defconfig
> +++ b/configs/imx6-sabresd_defconfig
> @@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BOARDNAME="mx6sabresd"
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.01"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
>  BR2_TARGET_UBOOT_FORMAT_IMG=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="SPL"
> @@ -32,7 +32,7 @@ BR2_TARGET_UBOOT_SPL_NAME="SPL"
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.9"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.25"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
> diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
> index b23dd90192d3..8cdc0e254440 100644
> --- a/configs/imx6-sabresd_qt5_defconfig
> +++ b/configs/imx6-sabresd_qt5_defconfig
> @@ -30,7 +30,7 @@ BR2_ROOTFS_OVERLAY="board/freescale/imx6-sabresd/rootfs_overlay"
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BOARDNAME="mx6sabresd"
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.01"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
>  BR2_TARGET_UBOOT_FORMAT_IMG=y
>  BR2_TARGET_UBOOT_SPL=y
>  BR2_TARGET_UBOOT_SPL_NAME="SPL"
> @@ -38,7 +38,7 @@ BR2_TARGET_UBOOT_SPL_NAME="SPL"
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.9"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.25"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
