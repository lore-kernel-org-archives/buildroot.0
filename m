From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Jun 2020 13:52:54 +0200
Subject: [Buildroot] [PATCH] package/readline: update homepage link
In-Reply-To: <ddb7980486206b010ed4d7ab6c2f763da0c03a81.1592214467.git.baruch@tkos.co.il>
References: <ddb7980486206b010ed4d7ab6c2f763da0c03a81.1592214467.git.baruch@tkos.co.il>
Message-ID: <20200615115254.GA2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2020-06-15 12:47 +0300, Baruch Siach spake thusly:
> The old link is dead since 2017.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/readline/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/readline/Config.in b/package/readline/Config.in
> index 1cb0672cf154..7021472623c8 100644
> --- a/package/readline/Config.in
> +++ b/package/readline/Config.in
> @@ -6,4 +6,4 @@ config BR2_PACKAGE_READLINE
>  	  by applications that allow users to edit command lines
>  	  as they are typed in.
>  
> -	  https://cnswww.cns.cwru.edu/php/chet/readline/rltop.html
> +	  https://tiswww.case.edu/php/chet/readline/rltop.html
> -- 
> 2.27.0
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
