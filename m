From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Mon, 07 Jul 2014 17:22:19 +0200
Subject: [Buildroot] [PATCH 14/14] defconfig/wandboard: update kernel +
	bootlaoder
In-Reply-To: <cf148e58a53cf0c55c12e211c4367363bdf1dc0f.1404164261.git.yann.morin.1998@free.fr>
References: <cover.1404164261.git.yann.morin.1998@free.fr>
 <cf148e58a53cf0c55c12e211c4367363bdf1dc0f.1404164261.git.yann.morin.1998@free.fr>
Message-ID: <53BABB2B.8090207@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

There is a typo in the commit title : "bootloader" ;-).

On Mon, 30 Jun 2014 23:52:14 +0200, Yann E. Morin wrote:
[...]
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
>  BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.imx"

Is it still necessary to specify this custom name instead of using
BR2_TARGET_UBOOT_FORMAT_IMX ?

>  BR2_TARGET_UBOOT_ENVIMAGE=y
> @@ -16,7 +16,7 @@ BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/wandboard/uboot-env.txt"
>  BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x2000"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
> -BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://repo.or.cz/wandboard.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="86429847b5152f040f190015faedcac49b243328"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/wandboard-org/linux"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9d567e4f285e80bc332e79f0636259bc05a4ee3b"
>  BR2_LINUX_KERNEL_DEFCONFIG="wandboard"
>  BR2_LINUX_KERNEL_INSTALL_TARGET=y

Regards,

Hadrien
