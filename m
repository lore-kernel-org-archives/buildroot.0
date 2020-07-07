From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Jul 2020 23:05:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/libcamera: fix install staging
 typo
In-Reply-To: <20200706010952.848810-1-james.hilliard1@gmail.com>
References: <20200706010952.848810-1-james.hilliard1@gmail.com>
Message-ID: <20200707210532.GY2273@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-07-05 19:09 -0600, James Hilliard spake thusly:
> This won't enable install to staging unless capitalized.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libcamera/libcamera.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
> index ebdf2dba34..a39e9f1c3e 100644
> --- a/package/libcamera/libcamera.mk
> +++ b/package/libcamera/libcamera.mk
> @@ -16,7 +16,7 @@ LIBCAMERA_CONF_OPTS = \
>  	-Dandroid=false \
>  	-Ddocumentation=false \
>  	-Dtest=false
> -LIBCAMERA_INSTALL_STAGING = yes
> +LIBCAMERA_INSTALL_STAGING = YES
>  LIBCAMERA_LICENSE = \
>  	LGPL-2.1+ (library), \
>  	GPL-2.0+ (utils), \
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
