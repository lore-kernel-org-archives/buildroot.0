From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 May 2021 13:47:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXfont2: add CPE
 variables
In-Reply-To: <20210514213513.2274629-1-fontaine.fabrice@gmail.com>
References: <20210514213513.2274629-1-fontaine.fabrice@gmail.com>
Message-ID: <20210515114754.GD2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-14 23:35 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:x:libxfont is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ax%3Alibxfont
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied, as well as the many other X11R7 related CPE varaibles, to
master. Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/x11r7/xlib_libXfont2/xlib_libXfont2.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
> index 611b8af548..d2ff4ca7f3 100644
> --- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
> +++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
> @@ -9,6 +9,8 @@ XLIB_LIBXFONT2_SOURCE = libXfont2-$(XLIB_LIBXFONT2_VERSION).tar.bz2
>  XLIB_LIBXFONT2_SITE = http://xorg.freedesktop.org/releases/individual/lib
>  XLIB_LIBXFONT2_LICENSE = MIT
>  XLIB_LIBXFONT2_LICENSE_FILES = COPYING
> +XLIB_LIBXFONT2_CPE_ID_VENDOR = x
> +XLIB_LIBXFONT2_CPE_ID_PRODUCT = libxfont
>  XLIB_LIBXFONT2_INSTALL_STAGING = YES
>  # 0001-configure-define-HAVE_LIBBSD-when-libbsd-was-found.patch
>  XLIB_LIBXFONT2_AUTORECONF = YES
> -- 
> 2.30.2
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
