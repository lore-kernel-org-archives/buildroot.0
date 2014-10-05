From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Oct 2014 10:10:02 +0200
Subject: [Buildroot] [PATCH] package/libdvdnav: fix typo:
 BR2_PREEFER_STATIC_LIB
In-Reply-To: <1412483093-11686-1-git-send-email-jcmvbkbc@gmail.com>
References: <1412483093-11686-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20141005081002.GA4220@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Max, All,

On 2014-10-05 08:24 +0400, Max Filippov spake thusly:
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libdvdnav/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libdvdnav/Config.in b/package/libdvdnav/Config.in
> index fed3b16..40a375a 100644
> --- a/package/libdvdnav/Config.in
> +++ b/package/libdvdnav/Config.in
> @@ -12,4 +12,4 @@ config BR2_PACKAGE_LIBDVDNAV
>  	  http://www.mplayerhq.hu
>  
>  comment "libdvdnav needs a toolchain w/ dynamic library, largefile, threads"
> -	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREEFER_STATIC_LIB
> +	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
> -- 
> 1.8.1.4
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
