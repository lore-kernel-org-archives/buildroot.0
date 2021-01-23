From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Jan 2021 21:20:45 +0100
Subject: [Buildroot] [PATCH] configs/lafrite_defconfig: bump kernel to
 5.10.9
In-Reply-To: <20210123111641.20734-1-peter@korsgaard.com>
References: <20210123111641.20734-1-peter@korsgaard.com>
Message-ID: <20210123202045.GA926565@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-01-23 12:16 +0100, Peter Korsgaard spake thusly:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/lafrite_defconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/lafrite_defconfig b/configs/lafrite_defconfig
> index 5496bbc30d..b3326f6b49 100644
> --- a/configs/lafrite_defconfig
> +++ b/configs/lafrite_defconfig
> @@ -1,6 +1,6 @@
>  BR2_aarch64=y
>  BR2_cortex_a53=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
>  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
>  BR2_SYSTEM_DHCP="eth0"
>  BR2_ROOTFS_OVERLAY="board/librecomputer/lafrite/overlay/"
> @@ -8,7 +8,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>  BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/librecomputer/lafrite/genimage.cfg"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.10"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.9"
>  BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-gxl-s805x-libretech-ac"
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
