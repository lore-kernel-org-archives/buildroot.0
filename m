From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Aug 2017 15:47:30 +0200
Subject: [Buildroot] [PATCH/next 3/3] package/weston: bump version to
 3.0.0
In-Reply-To: <20170822200436.24905-3-bernd.kuhls@t-online.de>
References: <20170822200436.24905-1-bernd.kuhls@t-online.de>
 <20170822200436.24905-3-bernd.kuhls@t-online.de>
Message-ID: <20170823154730.4750143b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Aug 2017 22:04:36 +0200, Bernd Kuhls wrote:

> diff --git a/package/weston/Config.in b/package/weston/Config.in
> index 454a14d39..61f157ec7 100644
> --- a/package/weston/Config.in
> +++ b/package/weston/Config.in
> @@ -17,8 +17,8 @@ config BR2_PACKAGE_WESTON
>  	select BR2_PACKAGE_CAIRO_PNG
>  	select BR2_PACKAGE_LIBPNG
>  	select BR2_PACKAGE_JPEG
> -	select BR2_PACKAGE_MTDEV
>  	select BR2_PACKAGE_LIBINPUT
> +	select BR2_PACKAGE_LIBDRM

So, the select BR2_PACKAGE_LIBDRM that was in BR2_PACKAGE_WESTON_DRM
should have been removed.

I've fixed that before applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
