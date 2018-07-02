From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Jul 2018 23:21:30 +0200
Subject: [Buildroot] [PATCH v3 02/22] package/efl: switch to xorgproto
In-Reply-To: <20180630110853.29339-3-bernd.kuhls@t-online.de>
References: <20180630110853.29339-1-bernd.kuhls@t-online.de>
 <20180630110853.29339-3-bernd.kuhls@t-online.de>
Message-ID: <20180702212130.GH2604@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2018-06-30 13:08 +0200, Bernd Kuhls spake thusly:
> The new package xorgproto will combine and replace all current xproto_*
> packages. For details read
> https://lists.x.org/archives/xorg-announce/2018-February/002835.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/efl/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/efl/Config.in b/package/efl/Config.in
> index b9b285d8da..5be6d63765 100644
> --- a/package/efl/Config.in
> +++ b/package/efl/Config.in
> @@ -168,7 +168,7 @@ config BR2_PACKAGE_EFL_X_XLIB
>  	select BR2_PACKAGE_XLIB_LIBXRENDER
>  	select BR2_PACKAGE_XLIB_LIBXSCRNSAVER
>  	select BR2_PACKAGE_XLIB_LIBXTST
> -	select BR2_PACKAGE_XPROTO_GLPROTO
> +	select BR2_PACKAGE_XORGPROTO
>  
>  config BR2_PACKAGE_EFL_WAYLAND
>  	bool "Wayland support"
> -- 
> 2.17.1
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
