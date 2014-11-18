From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Nov 2014 22:03:37 +0100
Subject: [Buildroot] [PATCH v4 3/4] libunistring: Add
 host-autotools-package
In-Reply-To: <1415310486-25904-4-git-send-email-paguilar@paguilar.org>
References: <1415310486-25904-1-git-send-email-paguilar@paguilar.org>
 <1415310486-25904-4-git-send-email-paguilar@paguilar.org>
Message-ID: <20141118210337.GK4333@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pedro, All,

On 2014-11-06 22:48 +0100, Pedro Aguilar spake thusly:
> The host-libunistring is needed by guile
> 
> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
> - Add host-libunistring (suggested by Yann Morin)
> 
> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
> ---
>  package/libunistring/libunistring.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
> index 3234ddc..fd77d12 100644
> --- a/package/libunistring/libunistring.mk
> +++ b/package/libunistring/libunistring.mk
> @@ -17,3 +17,4 @@ LIBUNISTRING_CONF_OPTS += --disable-threads
>  endif
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
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
