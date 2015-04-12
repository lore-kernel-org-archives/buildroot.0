From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Apr 2015 12:16:27 +0200
Subject: [Buildroot] [PATCH v2] giflib: remove from the description the
 reference to libungif
In-Reply-To: <1428833637-14667-1-git-send-email-fabio.porcedda@gmail.com>
References: <1428833637-14667-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150412101627.GE4218@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2015-04-12 12:13 +0200, Fabio Porcedda spake thusly:
> Starting from version 5.0 giflib it's no longer compatible with
> libungif, also the libungif is now deprecated so just remove the
> reference to libungif.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Baruch Siach <baruch@tkos.co.il>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/giflib/Config.in | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/package/giflib/Config.in b/package/giflib/Config.in
> index 70368dc..fc1f85d 100644
> --- a/package/giflib/Config.in
> +++ b/package/giflib/Config.in
> @@ -1,8 +1,6 @@
>  config BR2_PACKAGE_GIFLIB
>  	bool "giflib"
>  	help
> -	  giflib is a library for reading and writing gif images. It is API and
> -	  ABI compatible with libungif which was in wide use while the LZW
> -	  compression algorithm was patented.
> +	  giflib is a library for reading and writing gif images.
>  
>  	  http://sourceforge.net/projects/giflib
> -- 
> 2.3.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
