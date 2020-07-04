From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 4 Jul 2020 17:51:07 +0200
Subject: [Buildroot] [PATCH] qemu_aarch64_virt: bump to Linux 5.7.7
In-Reply-To: <20200704142656.1587689-1-masahiroy@kernel.org>
References: <20200704142656.1587689-1-masahiroy@kernel.org>
Message-ID: <9d073d28-f4ff-24e4-1139-85adf1159112@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Masahiro,

Le 04/07/2020 ? 16:26, Masahiro Yamada a ?crit?:
> The latest Linux version works.

We are using the same kernel LTS version 5.4.x for all defconfig for Qemu, we
want to keep them in sync.

What is the motivation to make this update to the kernel 5.7 ?

Best regards,
Romain

> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  configs/qemu_aarch64_virt_defconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/configs/qemu_aarch64_virt_defconfig b/configs/qemu_aarch64_virt_defconfig
> index 5ca15f55b3..f924377191 100644
> --- a/configs/qemu_aarch64_virt_defconfig
> +++ b/configs/qemu_aarch64_virt_defconfig
> @@ -15,13 +15,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
>  
> -# Linux headers same as kernel, a 5.4 series
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
> +# Linux headers same as kernel, a 5.7 series
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_7=y
>  
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.42"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.7.7"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
>  
> 
