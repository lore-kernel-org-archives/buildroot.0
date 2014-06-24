From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Jun 2014 00:26:38 +0200
Subject: [Buildroot] [PATCH 15/54] libraw1394: add license information
In-Reply-To: <1403636160-11807-15-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-15-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140624222638.GR31767@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-24 15:55 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libraw1394/libraw1394.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libraw1394/libraw1394.mk b/package/libraw1394/libraw1394.mk
> index 166c782..108dde9 100644
> --- a/package/libraw1394/libraw1394.mk
> +++ b/package/libraw1394/libraw1394.mk
> @@ -8,5 +8,7 @@ LIBRAW1394_VERSION = 2.0.7
>  LIBRAW1394_SOURCE = libraw1394-$(LIBRAW1394_VERSION).tar.xz
>  LIBRAW1394_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ieee1394
>  LIBRAW1394_INSTALL_STAGING = YES
> +LIBRAW1394_LICENSE = LGPLv2.1+
> +LIBRAW1394_LICENSE_FILES = COPYING.LIB
>  
>  $(eval $(autotools-package))
> -- 
> 1.8.5.5
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
