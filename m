From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Oct 2014 16:45:12 +0200
Subject: [Buildroot] [PATCH 3/8] package/apr-util: Add comment to
 describe toolchain dependencies
In-Reply-To: <1412516718-12597-3-git-send-email-bernd.kuhls@t-online.de>
References: <1412516718-12597-1-git-send-email-bernd.kuhls@t-online.de>
 <1412516718-12597-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141005144512.GH4220@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-10-05 15:45 +0200, Bernd Kuhls spake thusly:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, this should go first in the series.

Regards,
Yann E. MORIN.

> ---
>  package/apr-util/Config.in |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
> index 3d4ec23..fcef693 100644
> --- a/package/apr-util/Config.in
> +++ b/package/apr-util/Config.in
> @@ -12,3 +12,7 @@ config BR2_PACKAGE_APR_UTIL
>  	  The utility library for the apache runtime project
>  
>  	  http://apr.apache.org/
> +
> +comment "apr-util needs a toolchain w/ dynamic library"
> +	depends on BR2_USE_MMU
> +	depends on BR2_PREFER_STATIC_LIB
> -- 
> 1.7.10.4
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
