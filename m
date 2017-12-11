From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 11 Dec 2017 09:19:42 -0800
Subject: [Buildroot] [PATCH 4/9] zynq_microzed: linux: bump to
 xilinx-v2017.3 (based on 4.9)
In-Reply-To: <1512855007-1834-5-git-send-email-luca@lucaceresoli.net>
References: <1512855007-1834-1-git-send-email-luca@lucaceresoli.net>
 <1512855007-1834-5-git-send-email-luca@lucaceresoli.net>
Message-ID: <CAKmqyKO6qM9d+eMOLac5WWzjTBrJ4o0zbJKR_UcuFEGiVFk1yw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Dec 9, 2017 at 1:30 PM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> [Build-tested only]
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Acked-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  configs/zynq_microzed_defconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
> index f6e1599930f1..a3c25f9a0e7c 100644
> --- a/configs/zynq_microzed_defconfig
> +++ b/configs/zynq_microzed_defconfig
> @@ -2,12 +2,12 @@ BR2_arm=y
>  BR2_cortex_a9=y
>  BR2_ARM_ENABLE_NEON=y
>  BR2_ARM_ENABLE_VFP=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2016.2"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2017.3"
>  BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
>  BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> --
> 2.7.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
