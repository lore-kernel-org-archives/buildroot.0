From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 28 Jul 2016 12:43:47 -0500
Subject: [Buildroot] [PATCH 3/7] zynq_microzed: bump Linux to
	xilinx-v2016.2
In-Reply-To: <1468834703-27518-4-git-send-email-yamada.masahiro@socionext.com>
References: <1468834703-27518-1-git-send-email-yamada.masahiro@socionext.com>
 <1468834703-27518-4-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <CANQCQpb5yLeWczwW9PZmuDw5igfc7oaB10J_vAKW9hWmBGF+Qg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 18, 2016 at 4:38 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> This is the latest release tag in the Xilinx repository, based on
> Linux v4.4 in the mainline.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  configs/zynq_microzed_defconfig | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/configs/zynq_microzed_defconfig b/configs/zynq_microzed_defconfig
> index 06d0d7f..7b44af6 100644
> --- a/configs/zynq_microzed_defconfig
> +++ b/configs/zynq_microzed_defconfig
> @@ -1,13 +1,12 @@
>  BR2_arm=y
>  BR2_cortex_a9=y
>  BR2_ARM_ENABLE_NEON=y
> -# Linux headers same as kernel, a 3.18 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2015.1"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2016.2"

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

>  BR2_LINUX_KERNEL_DEFCONFIG="xilinx_zynq"
>  BR2_LINUX_KERNEL_UIMAGE=y
>  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
