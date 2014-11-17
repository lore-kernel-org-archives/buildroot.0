From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Nov 2014 20:01:01 +0100
Subject: [Buildroot] [PATCH] libgcrypt: link to a more informative
 homepage
In-Reply-To: <560438622c9e2d6313ef31c33d56fae1208987e2.1416249530.git.baruch@tkos.co.il>
References: <560438622c9e2d6313ef31c33d56fae1208987e2.1416249530.git.baruch@tkos.co.il>
Message-ID: <20141117190101.GB12473@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2014-11-17 20:38 +0200, Baruch Siach spake thusly:
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libgcrypt/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libgcrypt/Config.in b/package/libgcrypt/Config.in
> index 55d2f170cd36..dd8f270116a7 100644
> --- a/package/libgcrypt/Config.in
> +++ b/package/libgcrypt/Config.in
> @@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBGCRYPT
>  	help
>  	  LibGCrypt is GNU's basic cryptographic library.
>  
> -	  ftp://gd.tuwien.ac.at/privacy/gnupg/libgcrypt/
> +	  http://www.gnu.org/software/libgcrypt/
> -- 
> 2.1.3
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
