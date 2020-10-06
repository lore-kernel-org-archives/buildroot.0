From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 6 Oct 2020 08:23:09 -0300
Subject: [Buildroot] [PATCH v2 4/4] configs/mx6cubox: bump Linux and
 U-Boot versions
In-Reply-To: <20201006103955.464562-4-francois.perrad@gadz.org>
References: <20201006103955.464562-1-francois.perrad@gadz.org>
 <20201006103955.464562-4-francois.perrad@gadz.org>
Message-ID: <CAOMZO5A8cxt2maWjEzL98E8w5+ZkLeQK+Gr=BFTDjmC6s+hn1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francois,

On Tue, Oct 6, 2020 at 7:40 AM Francois Perrad <fperrad@gmail.com> wrote:
>
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  configs/mx6cubox_defconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/configs/mx6cubox_defconfig b/configs/mx6cubox_defconfig
> index 91848bc07..dc26758ef 100644
> --- a/configs/mx6cubox_defconfig
> +++ b/configs/mx6cubox_defconfig
> @@ -17,7 +17,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/solidrun/mx6cubox/post-image.sh"
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.8"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.69"
>  BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-cubox-i imx6dl-cubox-i-emmc-som-v15 imx6dl-cubox-i-som-v15 imx6dl-hummingboard imx6dl-hummingboard-emmc-som-v15 imx6dl-hummingboard-som-v15 imx6q-cubox-i imx6q-cubox-i-emmc-som-v15 imx6q-cubox-i-som-v15 imx6q-hummingboard imx6q-hummingboard-emmc-som-v15 imx6q-hummingboard-som-v15"
> @@ -32,7 +32,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.03"
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.01"

What about using 2020.07?

Thanks
