From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jan 2018 19:03:39 +0100
Subject: [Buildroot] [PATCH] swupdate: remove empty line
In-Reply-To: <20180114175306.18388-1-joerg.krause@embedded.rocks>
References: <20180114175306.18388-1-joerg.krause@embedded.rocks>
Message-ID: <20180114180339.GC20105@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J"org, All,

On 2018-01-14 18:53 +0100, J?rg Krause spake thusly:
> Reported by Yann E. Morin running:
> 
> ```
>     $ ./utils/check-package package/swupdate/swupdate.mk
>     package/swupdate/swupdate.mk:42: consecutive empty lines
>     140 lines processed
>     1 warnings generated
> ```

Note: I could have very well done it myself, but by having other do it,
that spreads the knowledge, and people get used to running it before
submitting. Or so I hope! ;-)

Thanks! :-)

> Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/swupdate/swupdate.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
> index d1afbc4882..aa232e5837 100644
> --- a/package/swupdate/swupdate.mk
> +++ b/package/swupdate/swupdate.mk
> @@ -39,7 +39,6 @@ else
>  SWUPDATE_MAKE_ENV += HAVE_LIBCURL=n
>  endif
>  
> -
>  ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER),y)
>  SWUPDATE_DEPENDENCIES += luainterpreter host-pkgconf
>  # defines the base name for the pkg-config file ("lua" or "luajit")
> -- 
> 2.15.1
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
