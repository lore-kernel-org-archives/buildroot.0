From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 20 Dec 2017 16:25:42 +0100
Subject: [Buildroot] [PATCH] libsoxr: remove unicode dash from help text
In-Reply-To: <aba1f1782c8833a67af16f2325a5fccf6cc2e689.1513782978.git.baruch@tkos.co.il>
References: <aba1f1782c8833a67af16f2325a5fccf6cc2e689.1513782978.git.baruch@tkos.co.il>
Message-ID: <20171220152542.GF21413@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2017-12-20 17:16 +0200, Baruch Siach spake thusly:
> This would make the unicode challenged menuconfig show something
> sensible.

It works well for me... But mconf here is linked against libncursesw.so.5
so I guess that's because the widechar ncurses is missing on your system.

> Split the sentence for the text to make sense.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libsoxr/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libsoxr/Config.in b/package/libsoxr/Config.in
> index a218ae99c89c..ae1ea1028030 100644
> --- a/package/libsoxr/Config.in
> +++ b/package/libsoxr/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBSOXR
>  	bool "libsoxr"
>  	help
>  	  The SoX Resampler library `libsoxr' performs one-dimensional
> -	  sample-rate conversion?it may be used, for example, to
> +	  sample-rate conversion. It may be used, for example, to
>  	  resample PCM-encoded audio.
>  
>  	  It aims to give fast and high quality results for any constant
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
