From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Apr 2017 19:15:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi: fix typos for
 libva/libvdpau dependencies
In-Reply-To: <20170430155540.21997-1-bernd.kuhls@t-online.de>
References: <20170430155540.21997-1-bernd.kuhls@t-online.de>
Message-ID: <20170430171537.GD12749@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-04-30 17:55 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/kodi/Config.in | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/kodi/Config.in b/package/kodi/Config.in
> index 6bc81338a..d7b269245 100644
> --- a/package/kodi/Config.in
> +++ b/package/kodi/Config.in
> @@ -240,25 +240,25 @@ config BR2_PACKAGE_KODI_LIBUSB
>  
>  config BR2_PACKAGE_KODI_LIBVA
>  	bool "va"
> -	depends on BR2_PACKAGE_KODI_EGL_GL
> +	depends on BR2_PACKAGE_KODI_GL_EGL
>  	depends on BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_LIBVA
>  	help
>  	  Enable libva support.
>  
>  comment "libva support needs X.org with an openGL backend"
> -	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_KODI_EGL_GL
> +	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_KODI_GL_EGL
>  
>  config BR2_PACKAGE_KODI_LIBVDPAU
>  	bool "vdpau"
> -	depends on BR2_PACKAGE_KODI_EGL_GL
> +	depends on BR2_PACKAGE_KODI_GL_EGL
>  	depends on BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_LIBVDPAU
>  	help
>  	  Enable libvdpau support.
>  
>  comment "libvdpau support needs X.org with an openGL backend"
> -	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_KODI_EGL_GL
> +	depends on !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_KODI_GL_EGL
>  
>  config BR2_PACKAGE_KODI_UPNP
>  	bool "upnp"
> -- 
> 2.11.0
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
