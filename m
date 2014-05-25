From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 May 2014 21:41:42 +0200
Subject: [Buildroot] [PATCH] xbmc: Add missing unicode properties
	supports
In-Reply-To: <1400954147-25609-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1400954147-25609-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140525194142.GC3542@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-05-24 19:55 +0200, Maxime Hadjinlian spake thusly:
> At startup, XBMC complains that PCRE is lacking unicode properties
> supports.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/xbmc/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
> index 0f45f5c..d94cdad 100644
> --- a/package/xbmc/Config.in
> +++ b/package/xbmc/Config.in
> @@ -40,6 +40,7 @@ menuconfig BR2_PACKAGE_XBMC
>  	select BR2_PACKAGE_NCURSES
>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_PCRE
> +	select BR2_PACKAGE_PCRE_UCP
>  	select BR2_PACKAGE_PYTHON
>  	select BR2_PACKAGE_PYTHON_BSDDB
>  	select BR2_PACKAGE_PYTHON_BZIP2
> -- 
> 2.0.0.rc0
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
