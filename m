From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 11 Dec 2017 09:19:22 -0800
Subject: [Buildroot] [PATCH 3/9] zynq_zed: u-boot: bump to xilinx-v2017.3
In-Reply-To: <1512855007-1834-4-git-send-email-luca@lucaceresoli.net>
References: <1512855007-1834-1-git-send-email-luca@lucaceresoli.net>
 <1512855007-1834-4-git-send-email-luca@lucaceresoli.net>
Message-ID: <CAKmqyKN8Z5h-HaeWN5PW_eOqsZ5Wy6pRg4odqpt1_GTOrQv0Gg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Dec 9, 2017 at 1:30 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> [Run-time tested]
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Acked-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  configs/zynq_zed_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configs/zynq_zed_defconfig b/configs/zynq_zed_defconfig
> index 1b03ad95a839..cd815982f806 100644
> --- a/configs/zynq_zed_defconfig
> +++ b/configs/zynq_zed_defconfig
> @@ -20,7 +20,7 @@ BR2_TARGET_UBOOT=y
>  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
>  BR2_TARGET_UBOOT_CUSTOM_GIT=y
>  BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/Xilinx/u-boot-xlnx.git"
> -BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2017.1"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2017.3"
>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="zynq_zed"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
> --
> 2.7.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
