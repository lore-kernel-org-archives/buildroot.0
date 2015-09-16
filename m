From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 16 Sep 2015 10:11:27 +0100
Subject: [Buildroot] [PATCH 2/2] configs/ci20: add u-boot version
 2013.10 (2015-09-15)
In-Reply-To: <1442329615-17465-2-git-send-email-0intro@gmail.com>
References: <1442329615-17465-1-git-send-email-0intro@gmail.com>
 <1442329615-17465-2-git-send-email-0intro@gmail.com>
Message-ID: <55F9323F.3050606@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear David du Colombier,

On 09/15/2015 04:06 PM, David du Colombier wrote:
> Signed-off-by: David du Colombier <0intro@gmail.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Regards,

Vincent.

> ---
>  configs/ci20_defconfig | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
> index ec814ba..e87181a 100644
> --- a/configs/ci20_defconfig
> +++ b/configs/ci20_defconfig
> @@ -15,3 +15,15 @@ BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/MIPS/CI20_linux.git"
>  BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="93b4df0786f07643eb61daee8934a3f3a05fd280"
>  BR2_LINUX_KERNEL_DEFCONFIG="ci20"
> +
> +# u-boot
> +BR2_TARGET_UBOOT=y
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y
> +BR2_TARGET_UBOOT_BOARDNAME="ci20_mmc"
> +BR2_TARGET_UBOOT_CUSTOM_GIT=y
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/MIPS/CI20_u-boot"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="a4f583551d0025eb957ee5c9cb68657a429e4914"
> +BR2_TARGET_UBOOT_VERSION="a4f583551d0025eb957ee5c9cb68657a429e4914"
> +BR2_TARGET_UBOOT_FORMAT_IMG=y
> +BR2_TARGET_UBOOT_SPL=y
> +BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin"
> 
