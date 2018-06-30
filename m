From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Jun 2018 23:00:34 +0200
Subject: [Buildroot] [PATCH v3 4/4] configs: add linux boot logo to
 raspberrypi3 defconfig
In-Reply-To: <1527628939-7389-5-git-send-email-angelo@amarulasolutions.com>
References: <1527628939-7389-1-git-send-email-angelo@amarulasolutions.com>
 <1527628939-7389-5-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20180630210034.GE23012@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2018-05-29 23:22 +0200, Angelo Compagnucci spake thusly:
> From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> 
> This patch adds a custom boot up logo to the raspberrypi3
> defconfig.

Why the rpi3, and not the otehr configs?

Note that I don't mind much, but I'd like we be a bit consistent in all
our defconfigs. Either all the defconfigs use the BR logo, or none of
them do.

Regards,
Yann E. MORIN.

> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  configs/raspberrypi3_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
> index 45a76be..ed3d28d 100644
> --- a/configs/raspberrypi3_defconfig
> +++ b/configs/raspberrypi3_defconfig
> @@ -13,6 +13,7 @@ BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,c117a8bccf37bfba323065b566cf999ed4629a4a)/linux-c117a8bccf37bfba323065b566cf999ed4629a4a.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
> +BR2_LINUX_KERNEL_CUSTOMLOGO_PATH="docs/images/logo_linux_clut224.png"
>  
>  # Build the DTB from the kernel sources
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -- 
> 2.7.4
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
