From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Jun 2016 23:58:52 +0200
Subject: [Buildroot] [PATCH 2/2] package/omxplayer: remove
 BR2_PACKAGE_BOOST_ARCH_SUPPORTS option
In-Reply-To: <1465045981-8529-2-git-send-email-bernd.kuhls@t-online.de>
References: <1465045981-8529-1-git-send-email-bernd.kuhls@t-online.de>
 <1465045981-8529-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160605215852.GC3832@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2016-06-04 15:13 +0200, Bernd Kuhls spake thusly:
> The option was globally removed with
> https://git.busybox.net/buildroot/commit/package/boost?id=668ce456448d671f30bf98c4d4819a88b0bf9f4e
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/omxplayer/Config.in | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/omxplayer/Config.in b/package/omxplayer/Config.in
> index b8946e9..b417aa3 100644
> --- a/package/omxplayer/Config.in
> +++ b/package/omxplayer/Config.in
> @@ -2,7 +2,6 @@ config BR2_PACKAGE_OMXPLAYER
>  	bool "omxplayer"
>  	depends on BR2_arm
>  	depends on BR2_USE_MMU # dbus
> -	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS # boost
>  	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS # ffmpeg
>  	depends on BR2_INSTALL_LIBSTDCPP # boost
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libusb
> @@ -28,7 +27,6 @@ config BR2_PACKAGE_OMXPLAYER
>  comment "omxplayer needs rpi-userland and a toolchain w/ C++, threads, wchar, dynamic library"
>  	depends on BR2_arm
>  	depends on BR2_USE_MMU
> -	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
>  	depends on !BR2_PACKAGE_RPI_USERLAND
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
> -- 
> 2.8.1
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
