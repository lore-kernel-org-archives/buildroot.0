From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Jun 2014 00:23:13 +0200
Subject: [Buildroot] [PATCH 14/54] libiqrf: add license information
In-Reply-To: <1403636160-11807-14-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-14-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140624222313.GQ31767@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-06-24 15:55 -0300, Gustavo Zacarias spake thusly:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

All files refer to LGPLv2.1+.

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libiqrf/libiqrf.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
> index ec0d599..0531602 100644
> --- a/package/libiqrf/libiqrf.mk
> +++ b/package/libiqrf/libiqrf.mk
> @@ -7,7 +7,7 @@
>  LIBIQRF_VERSION = v0.1.2
>  LIBIQRF_SITE = $(call github,nandra,libiqrf,$(LIBIQRF_VERSION))
>  LIBIQRF_INSTALL_STAGING = YES
> -
>  LIBIQRF_DEPENDENCIES = libusb
> +LIBIQRF_LICENSE = LGPLv2.1+
>  
>  $(eval $(cmake-package))
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
