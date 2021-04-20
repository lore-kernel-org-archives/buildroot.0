From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Apr 2021 23:20:27 +0200
Subject: [Buildroot] [PATCH 12/25] package/libqmi: add _CPE_ID_VENDOR
In-Reply-To: <20210420201146.42858-12-matthew.weber@rockwellcollins.com>
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
 <20210420201146.42858-12-matthew.weber@rockwellcollins.com>
Message-ID: <20210420212026.GJ298901@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew, All,

On 2021-04-20 15:11 -0500, Matt Weber spake thusly:
> cpe:2.3:a:libqmi_project:libqmi:* is a valid CPE identifier for this package:
> 
>  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:libqmi_project:libqmi

You forgot your SoB line...

Regards,
Yann E. MORIN.

> ---
>  package/libqmi/libqmi.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
> index 4b430d11f8..01910898c9 100644
> --- a/package/libqmi/libqmi.mk
> +++ b/package/libqmi/libqmi.mk
> @@ -10,6 +10,7 @@ LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
>  LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
>  LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
>  LIBQMI_INSTALL_STAGING = YES
> +LIBQMI_CPE_ID_VENDOR = libqmi_project
>  
>  LIBQMI_DEPENDENCIES = libglib2
>  
> -- 
> 2.17.1
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
