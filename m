From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 03 Aug 2019 15:38:45 +0200
Subject: [Buildroot] [PATCH v2 4/7] configs/qemu-*: add host-qemu-system
References: <1557075239-30667-1-git-send-email-jugurtha.belkalem@smile.fr>
 <1557075239-30667-5-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <5cfg1gxvf.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 05 May 2019 18:53:56 +0200 schrieb Jugurtha BELKALEM:

> diff --git a/configs/qemu_xtensa_lx60_defconfig b/configs/
qemu_xtensa_lx60_defconfig
> index 4287e6a..a5fd14b 100644
> --- a/configs/qemu_xtensa_lx60_defconfig
> +++ b/configs/qemu_xtensa_lx60_defconfig
> @@ -26,3 +26,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
>  
>  # Kernel needs mkimage
>  BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +
> +# host-qemu for gitlab testing
> +BR2_PACKAGE_HOST_QEMU=y
> +BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
> diff --git a/configs/qemu_xtensa_lx60_nommu_defconfig b/configs/
qemu_xtensa_lx60_nommu_defconfig
> index 37b6743..750e37d 100644
> --- a/configs/qemu_xtensa_lx60_nommu_defconfig
> +++ b/configs/qemu_xtensa_lx60_nommu_defconfig
> @@ -30,3 +30,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="Image"
>  
>  # Kernel needs mkimage
>  BR2_PACKAGE_HOST_UBOOT_TOOLS=y
> +
> +# host-qemu for gitlab testing
> +BR2_PACKAGE_HOST_QEMU=y
> +BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y

Hi Jugurtha,

this patch added qemu-host support for xtensa, but
https://git.buildroot.net/buildroot/tree/package/qemu/Config.in.host
has no support for xtensa.

Regards, Bernd
