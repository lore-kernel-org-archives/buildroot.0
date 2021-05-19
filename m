From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 23:10:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/libgtk3: add CPE variables
In-Reply-To: <20210519203952.51993-1-fontaine.fabrice@gmail.com>
References: <20210519203952.51993-1-fontaine.fabrice@gmail.com>
Message-ID: <20210519211058.GQ2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-19 22:39 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:gnome:gtk is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnome%3Agtk
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libgtk3/libgtk3.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
> index f7345cf2e9..9ece409ba3 100644
> --- a/package/libgtk3/libgtk3.mk
> +++ b/package/libgtk3/libgtk3.mk
> @@ -10,6 +10,8 @@ LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
>  LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
>  LIBGTK3_LICENSE = LGPL-2.0+
>  LIBGTK3_LICENSE_FILES = COPYING
> +LIBGTK3_CPE_ID_VENDOR = gnome
> +LIBGTK3_CPE_ID_PRODUCT = gtk
>  LIBGTK3_INSTALL_STAGING = YES
>  LIBGTK3_AUTORECONF = YES
>  
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
