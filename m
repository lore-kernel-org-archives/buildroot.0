From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Mar 2016 22:58:37 +0100
Subject: [Buildroot] [PATCH 3/3] configs: pandaboard: bump kernel to 4.5
In-Reply-To: <1458077996-15549-3-git-send-email-peter@korsgaard.com>
References: <1458077996-15549-1-git-send-email-peter@korsgaard.com>
 <1458077996-15549-3-git-send-email-peter@korsgaard.com>
Message-ID: <20160315215837.GI5053@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2016-03-15 22:39 +0100, Peter Korsgaard spake thusly:
> Notice: We cannot move to u-boot 2016.03 without changing the boot setup as
> 2016.03 broke legacy boot on omap4.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  configs/pandaboard_defconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/configs/pandaboard_defconfig b/configs/pandaboard_defconfig
> index 3727e3d..973d41d 100644
> --- a/configs/pandaboard_defconfig
> +++ b/configs/pandaboard_defconfig
> @@ -2,14 +2,14 @@ BR2_arm=y
>  BR2_cortex_a9=y
>  BR2_ARM_ENABLE_NEON=y
>  BR2_ARM_ENABLE_VFP=y
> -BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_5=y
>  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
>  BR2_TARGET_GENERIC_GETTY_PORT="ttyO2"
>  BR2_SYSTEM_DHCP="eth0"
>  BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pandaboard/post-image.sh"
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.3"
> +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
>  BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
>  BR2_LINUX_KERNEL_ZIMAGE=y
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -- 
> 2.7.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
