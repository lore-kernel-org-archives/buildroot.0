From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Jun 2021 14:44:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/efibootmgr: fix comment
In-Reply-To: <20210605090849.270654-1-bernd.kuhls@t-online.de>
References: <20210605090849.270654-1-bernd.kuhls@t-online.de>
Message-ID: <20210605124425.GP168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-06-05 11:08 +0200, Bernd Kuhls spake thusly:
> Building efibootmgr with a musl toolchain is possible.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/efibootmgr/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/efibootmgr/Config.in b/package/efibootmgr/Config.in
> index d31f9b13ee..98ff71c996 100644
> --- a/package/efibootmgr/Config.in
> +++ b/package/efibootmgr/Config.in
> @@ -15,7 +15,7 @@ config BR2_PACKAGE_EFIBOOTMGR
>  
>  	  https://github.com/rhboot/efibootmgr
>  
> -comment "efibootmgr needs a glibc or uClibc toolchain w/ dynamic library, headers >= 3.12, gcc >= 4.9"
> +comment "efibootmgr needs a toolchain w/ dynamic library, headers >= 3.12, gcc >= 4.9"
>  	depends on BR2_PACKAGE_EFIVAR_ARCH_SUPPORTS
>  	depends on BR2_STATIC_LIBS || \
>  		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12 || \
> -- 
> 2.29.2
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
