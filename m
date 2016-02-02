From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2016 13:50:48 +0100
Subject: [Buildroot] [PATCH 1/1] Update
	freescale_imx6qsabreauto_defconfig
In-Reply-To: <1454407564-6117-1-git-send-email-jan.sarenik@ysoft.com>
References: <1454407564-6117-1-git-send-email-jan.sarenik@ysoft.com>
Message-ID: <56B0A628.2000003@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02-02-16 11:06, Jan Sarenik wrote:
> Signed-off-by: Jan Sarenik <jan.sarenik@ysoft.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 (build test of this defconfig)

 Regards,
 Arnout

> ---
>  configs/freescale_imx6qsabreauto_defconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/freescale_imx6qsabreauto_defconfig b/configs/freescale_imx6qsabreauto_defconfig
> index 70367a7..38af560 100644
> --- a/configs/freescale_imx6qsabreauto_defconfig
> +++ b/configs/freescale_imx6qsabreauto_defconfig
> @@ -17,7 +17,7 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc3"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.28_1.0.0_ga"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> @@ -32,4 +32,4 @@ BR2_TARGET_UBOOT_BOARDNAME="mx6qsabreauto"
>  BR2_TARGET_UBOOT_FORMAT_IMX=y
>  BR2_TARGET_UBOOT_CUSTOM_GIT=y
>  BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.freescale.com/imx/uboot-imx.git"
> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.14.28_1.0.0_ga"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_3.14.52_1.1.0_ga"
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
