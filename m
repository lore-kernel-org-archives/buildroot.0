From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Sep 2014 22:04:52 +0200
Subject: [Buildroot] [PATCH] BR2_DEPRECATED: update option label and help
In-Reply-To: <1411134069-3327-1-git-send-email-gustavo@zacarias.com.ar>
References: <1411134069-3327-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140919200452.GA4155@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-09-19 10:41 -0300, Gustavo Zacarias spake thusly:
> We should use positive logic (show things that are otherwise hidden...)
> for the help since it's what it does.
> It also applies to more options than just packages alone, for example
> the AVR32 architecture so add an "options" label to it.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Except for a small comment, below...

> ---
>  Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index 14ff55b..b494fab 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -301,9 +301,10 @@ config BR2_CCACHE_INITIAL_SETUP
>  endif
>  
>  config BR2_DEPRECATED
> -	bool "Show packages that are deprecated or obsolete"
> +	bool "Show options and packages that are deprecated or obsolete"
>  	help
> -	  This option hides outdated/obsolete versions of packages.
> +	  This option shows outdated/obsolete versions of packages and
> +	  options that are hidden otherwise.

In English, adverbs are placed before the past participle, like you did
your commit log:  ... otherwise hidden.

Regards,
Yann E. MORIN.

>  
>  if BR2_DEPRECATED
>  
> -- 
> 1.8.5.5
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
