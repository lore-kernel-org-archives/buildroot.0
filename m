From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 28 Jul 2016 12:45:11 -0500
Subject: [Buildroot] [PATCH 5/7] zynq_zc706: bump Linux to xilinx-v2016.2
In-Reply-To: <1468834703-27518-6-git-send-email-yamada.masahiro@socionext.com>
References: <1468834703-27518-1-git-send-email-yamada.masahiro@socionext.com>
 <1468834703-27518-6-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <CANQCQpY=H0BoCHphRAprTOzwcs6--J9ndOVwKnkttJVyC0vwtQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Mon, Jul 18, 2016 at 4:38 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> This is the latest release tag in the Xilinx repository, based on
> Linux v4.4 in the mainline.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  configs/zynq_zc706_defconfig | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/configs/zynq_zc706_defconfig b/configs/zynq_zc706_defconfig
> index 2dc4adb..746abcb 100644
> --- a/configs/zynq_zc706_defconfig
> +++ b/configs/zynq_zc706_defconfig
> @@ -2,13 +2,12 @@ BR2_arm=y
>  BR2_cortex_a9=y
>  BR2_ARM_ENABLE_VFP=y
>  BR2_ARM_ENABLE_NEON=y
> -# Linux headers same as kernel, a 3.14 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_14=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttyPS0"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Xilinx/linux-xlnx.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2014.2.01"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="xilinx-v2016.2"
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

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
