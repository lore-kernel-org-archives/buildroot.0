From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 23:34:48 +0200
Subject: [Buildroot] [PATCH 02/31] libplayer: fix typo on BR2_nios2
In-Reply-To: <1413749285-1108-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1413749285-1108-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141019213448.GC12247@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-19 22:07 +0200, Thomas Petazzoni spake thusly:
> libplayer is using BR2_nios, but it should be BR2_nios2.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libplayer/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
> index 4f5404c..703b96d 100644
> --- a/package/libplayer/Config.in
> +++ b/package/libplayer/Config.in
> @@ -14,7 +14,7 @@ config BR2_PACKAGE_LIBPLAYER_MPLAYER
>  	bool "mplayer backend"
>  	# mplayer
>  	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb || \
> -		   BR2_microblaze || BR2_aarch64 || BR2_nios)
> +		   BR2_microblaze || BR2_aarch64 || BR2_nios2)
>  	# mplayer
>  	depends on BR2_LARGEFILE
>  	# mplayer
> -- 
> 2.0.0
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
