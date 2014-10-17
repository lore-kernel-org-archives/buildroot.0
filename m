From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Oct 2014 00:34:59 +0200
Subject: [Buildroot] [PATCH] ncurses: fix typo 'target'
In-Reply-To: <1413558747-31850-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
References: <1413558747-31850-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <20141017223459.GC7944@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sebastien, All,

On 2014-10-17 11:12 -0400, Sebastien Bourdelin spake thusly:
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/ncurses/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ncurses/Config.in b/package/ncurses/Config.in
> index 3cc0a37..44713f9 100644
> --- a/package/ncurses/Config.in
> +++ b/package/ncurses/Config.in
> @@ -36,6 +36,6 @@ config BR2_PACKAGE_NCURSES_TARGET_MENU
>  config BR2_PACKAGE_NCURSES_TARGET_PROGS
>  	bool "ncurses programs"
>  	help
> -	  Include ncurses programs in traget (clear, reset, tput, ...)
> +	  Include ncurses programs in target (clear, reset, tput, ...)
>  
>  endif
> -- 
> 1.8.3.4
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
