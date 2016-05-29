From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 May 2016 00:01:08 +0200
Subject: [Buildroot] [PATCH] warpboard: README: Fix a few typos
In-Reply-To: <1464559134-3411-1-git-send-email-festevam@gmail.com>
References: <1464559134-3411-1-git-send-email-festevam@gmail.com>
Message-ID: <20160529220108.GD29556@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2016-05-29 18:58 -0300, Fabio Estevam spake thusly:
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  board/freescale/warpboard/README | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/board/freescale/warpboard/README b/board/freescale/warpboard/README
> index d826b2d..7e6bdc5 100644
> --- a/board/freescale/warpboard/README
> +++ b/board/freescale/warpboard/README
> @@ -29,7 +29,7 @@ Update uboot
>   => env default -f -a
>   => saveenv
>  
> -- Run the DFU toocommand in U-Boot:
> +- Run the DFU command in U-Boot:
>   => dfu 0 mmc 0
>  
>  - Transfer U-Boot into flash by running this command in host side:
> @@ -42,7 +42,7 @@ Update uboot
>  Update linux & rootfs
>  =====================
>  
> -Run the 'ums' command from the u6Boot prompt to mount the eMMC as mass
> +Run the 'ums' command from the U-Boot prompt to mount the eMMC as mass
>  storage and update zImage, device tree (imx6sl-warp.dtb) and rootfs
>  file (rootfs.tar) :
>  
> -- 
> 1.9.1
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
