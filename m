From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 May 2017 22:29:11 +0200
Subject: [Buildroot] [PATCH 1/3] package/bluez_utils: add missing
 host-pkgconf dependency
In-Reply-To: <20170513171009.5219-1-romain.naour@gmail.com>
References: <20170513171009.5219-1-romain.naour@gmail.com>
Message-ID: <20170513202911.GC15337@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2017-05-13 19:10 +0200, Romain Naour spake thusly:
> The configure script use pkg-config.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/bluez_utils/bluez_utils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
> index b396886..526804a 100644
> --- a/package/bluez_utils/bluez_utils.mk
> +++ b/package/bluez_utils/bluez_utils.mk
> @@ -8,7 +8,7 @@ BLUEZ_UTILS_VERSION = 4.101
>  BLUEZ_UTILS_SOURCE = bluez-$(BLUEZ_UTILS_VERSION).tar.xz
>  BLUEZ_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
>  BLUEZ_UTILS_INSTALL_STAGING = YES
> -BLUEZ_UTILS_DEPENDENCIES = dbus libglib2
> +BLUEZ_UTILS_DEPENDENCIES = host-pkgconf dbus libglib2
>  BLUEZ_UTILS_CONF_OPTS = --enable-test --enable-tools
>  BLUEZ_UTILS_AUTORECONF = YES
>  BLUEZ_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
> -- 
> 2.9.3
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
