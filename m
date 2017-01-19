From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 19 Jan 2017 23:35:44 +0100
Subject: [Buildroot] [PATCH] configs: beaglebone: bump kernel version to
 4.4.32
In-Reply-To: <1484728426-6610-1-git-send-email-lothar.felten@gmail.com>
References: <1484728426-6610-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <30b7694f-a863-16a6-84f0-e47ed2a2e543@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Lothar,

Le 18/01/2017 ? 09:33, Lothar Felten a ?crit :
> Switch to Linux kernel version 4.4.32 from the TI SDK 03.02.00.05
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>

Thanks for this test, I'll remove my previous patch fixing the BBB 4.1.6 kernel
with gcc6.

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
>  configs/beaglebone_defconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
> index eefa81c..6fe3a5e 100644
> --- a/configs/beaglebone_defconfig
> +++ b/configs/beaglebone_defconfig
> @@ -1,13 +1,13 @@
>  BR2_arm=y
>  BR2_cortex_a8=y
>  BR2_GLOBAL_PATCH_DIR="board/beaglebone/patches"
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/beaglebone/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/processor-sdk/processor-sdk-linux.git"
> -BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="52c4aa7cdb93d61f8008f380135beaf7b8fa6593"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="adde2ca9f86797071f6e7b2b9e779fa5e4a8f3cd"
>  BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-evmsk"
> 
