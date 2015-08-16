From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Aug 2015 11:42:48 +0200
Subject: [Buildroot] [PATCH] libv4l: update homepage link
In-Reply-To: <00a56e2f1858587033563e1f43f12fa7aa5aa357.1439713778.git.baruch@tkos.co.il>
References: <00a56e2f1858587033563e1f43f12fa7aa5aa357.1439713778.git.baruch@tkos.co.il>
Message-ID: <20150816094248.GB3650@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2015-08-16 11:29 +0300, Baruch Siach spake thusly:
> The official wiki page is more informative and up to date.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libv4l/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
> index da9bd83de24a..d137613b9b9b 100644
> --- a/package/libv4l/Config.in
> +++ b/package/libv4l/Config.in
> @@ -14,7 +14,7 @@ config BR2_PACKAGE_LIBV4L
>  	  layer on top of video4linux2 devices. libv4l consists of 3 different
>  	  libraries: libv4lconvert, libv4l1 and libv4l2.
>  
> -	  http://freshmeat.net/projects/libv4l
> +	  http://linuxtv.org/wiki/index.php/V4l-utils
>  
>  if BR2_PACKAGE_LIBV4L
>  
> -- 
> 2.5.0
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
