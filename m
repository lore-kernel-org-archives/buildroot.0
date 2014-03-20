From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 Mar 2014 00:18:22 +0100
Subject: [Buildroot] [PATCH 5/6] manual/adding-packages-generic.txt:
 change the default value of <PKG>_SOURCE variable
In-Reply-To: <1395353250-9475-6-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1395353250-9475-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <1395353250-9475-6-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20140320231822.GE20862@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jerzy, All,

On 2014-03-20 23:07 +0100, Jerzy Grzegorek spake thusly:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  docs/manual/adding-packages-generic.txt |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index 366b896..e125498 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -211,7 +211,7 @@ information is (assuming the package name is +libfoo+) :
>    the package. If +HOST_LIBFOO_SOURCE+ is not specified, it
>    defaults to +LIBFOO_SOURCE+. If none are specified, then
>    the value is assumed to be
> -  +packagename-$(LIBFOO_VERSION).tar.gz+. +
> +  +libfoo-$(LIBFOO_VERSION).tar.gz+. +
>    Example: +LIBFOO_SOURCE = foobar-$(LIBFOO_VERSION).tar.bz2+
>  
>  * +LIBFOO_PATCH+ may contain a space-separated list of patch file
> -- 
> 1.7.9.5
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
