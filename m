From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 30 Apr 2015 11:00:24 +0200
Subject: [Buildroot] [v6,
 13/15] freescale_imx6*_defconfig: bump kernel to 3.10.17_1.0.1_ga
In-Reply-To: <1421451251-23366-14-git-send-email-jezz@sysmic.org>
References: <1421451251-23366-14-git-send-email-jezz@sysmic.org>
Message-ID: <20150430090024.GM24549@t450s.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Sat, Jan 17, 2015 at 12:34:09AM +0100, J?r?me Pouiller wrote:
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  configs/freescale_imx6dlsabresd_defconfig   | 3 ++-
>  configs/freescale_imx6qsabresd_defconfig    | 3 ++-
>  configs/freescale_imx6sololiteevk_defconfig | 3 ++-
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/configs/freescale_imx6dlsabresd_defconfig b/configs/freescale_imx6dlsabresd_defconfig
> index 680031d..b4f0d74 100644
> --- a/configs/freescale_imx6dlsabresd_defconfig
> +++ b/configs/freescale_imx6dlsabresd_defconfig
> @@ -17,7 +17,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
> +# Last version of branch imx_3.10.17_1.0.1_ga
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="dac46dcf913585956a0e7a838e6f4b7465f00f57"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
> index f2f702e..9ca89cb 100644
> --- a/configs/freescale_imx6qsabresd_defconfig
> +++ b/configs/freescale_imx6qsabresd_defconfig
> @@ -17,7 +17,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
> +# Last version of branch imx_3.10.17_1.0.1_ga
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="dac46dcf913585956a0e7a838e6f4b7465f00f57"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> diff --git a/configs/freescale_imx6sololiteevk_defconfig b/configs/freescale_imx6sololiteevk_defconfig
> index f8ecc7b..f501fc3 100644
> --- a/configs/freescale_imx6sololiteevk_defconfig
> +++ b/configs/freescale_imx6sololiteevk_defconfig
> @@ -9,7 +9,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.freescale.com/imx/linux-2.6-imx.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_3.10.17_1.0.0_ga"
> +# Last version of branch imx_3.10.17_1.0.1_ga
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="dac46dcf913585956a0e7a838e6f4b7465f00f57"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y

As I do not have any SABRE board from Freescale I couldn't test those.
But the patch seems perfectly fine.

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
