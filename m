From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 16 Sep 2015 10:11:24 +0100
Subject: [Buildroot] [PATCH 1/2] configs/ci20: bump kernel version to
 3.18 (2015-09-14)
In-Reply-To: <1442329615-17465-1-git-send-email-0intro@gmail.com>
References: <1442329615-17465-1-git-send-email-0intro@gmail.com>
Message-ID: <55F9323C.1070800@imgtec.com>
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
>  configs/ci20_defconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
> index a7b7622..ec814ba 100644
> --- a/configs/ci20_defconfig
> +++ b/configs/ci20_defconfig
> @@ -5,13 +5,13 @@ BR2_mips_32r2=y
>  
>  # system
>  BR2_KERNEL_HEADERS_VERSION=y
> -BR2_DEFAULT_KERNEL_VERSION="3.0.8"
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_0=y
> +BR2_DEFAULT_KERNEL_VERSION="3.18"
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttyS4"
>  
>  # kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/MIPS/CI20_linux.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ba11adc7ac8792b0eb7415a1cc9c0968604a6fac"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="93b4df0786f07643eb61daee8934a3f3a05fd280"
>  BR2_LINUX_KERNEL_DEFCONFIG="ci20"
> 
