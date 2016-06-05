From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Jun 2016 23:58:25 +0200
Subject: [Buildroot] [PATCH 1/2] package/kodi: remove
 BR2_PACKAGE_BOOST_ARCH_SUPPORTS option, 2nd try
In-Reply-To: <1465045981-8529-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465045981-8529-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160605215825.GB3832@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2016-06-04 15:13 +0200, Bernd Kuhls spake thusly:
> For whatever reason this commit
> https://git.busybox.net/buildroot/commit/package/kodi?id=668ce456448d671f30bf98c4d4819a88b0bf9f4e
> did not make it into the master branch preventing to select the Kodi
> package in menuconfig.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/kodi/Config.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index d9760ca..a44ef5a 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -2,7 +2,6 @@ config BR2_PACKAGE_KODI_ARCH_SUPPORTS
>  	bool
>  	default y if (BR2_arm || (BR2_mipsel && BR2_TOOLCHAIN_USES_GLIBC) || BR2_i386 || BR2_x86_64) \
>  		&& BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS \
> -		&& BR2_PACKAGE_BOOST_ARCH_SUPPORTS \
>  		&& BR2_TOOLCHAIN_HAS_SYNC_8
>  
>  comment "kodi needs a uClibc or (e)glibc toolchain w/ C++, threads, wchar, dynamic library, gcc >= 4.7, host gcc >= 4.6"
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
