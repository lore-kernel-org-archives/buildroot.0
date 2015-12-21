From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Dec 2015 23:32:01 +0100
Subject: [Buildroot] [PATCH] directfb/legacy: add that it was removed
In-Reply-To: <1450735868-20515-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1450735868-20515-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <20151221223201.GH3454@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2015-12-21 19:11 -0300, gustavo.zacarias at free-electrons.com spake thusly:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> As pointed by Yann.
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarisa@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks! :-)

Regards,
Yann E. MORIN.

> ---
>  Config.in.legacy | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index a21ea82..82ab375 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,7 +146,7 @@ endif
>  comment "Legacy options removed in 2016.02"
>  
>  config BR2_PACKAGE_DIRECTFB_CLE266
> -	bool "cle266 driver for directfb"
> +	bool "cle266 driver for directfb removed"
>  	select BR2_LEGACY
>  	help
>  	  The cle266 directfb driver support has been removed.
> @@ -154,7 +154,7 @@ config BR2_PACKAGE_DIRECTFB_CLE266
>  	  anyone has any use for it.
>  
>  config BR2_PACKAGE_DIRECTFB_UNICHROME
> -	bool "unichrome driver for directfb"
> +	bool "unichrome driver for directfb removed"
>  	select BR2_LEGACY
>  	help
>  	  The unichrome directfb driver support has been removed.
> -- 
> 2.4.10
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
