From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Jun 2014 21:01:39 +0200
Subject: [Buildroot] [PATCH v2 01/11] libfslvpuwrap: change version to
	be independent
In-Reply-To: <1403846694-21974-2-git-send-email-bisson.gary@gmail.com>
References: <1403150639-29382-1-git-send-email-bisson.gary@gmail.com>
 <1403846694-21974-1-git-send-email-bisson.gary@gmail.com>
 <1403846694-21974-2-git-send-email-bisson.gary@gmail.com>
Message-ID: <20140629190139.GB30509@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary, All,

On 2014-06-26 22:24 -0700, Gary Bisson spake thusly:
> in future releases, libfslvpuwrap will have a version number independent
> from freescale-imx package.
> 
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libfslvpuwrap/libfslvpuwrap.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libfslvpuwrap/libfslvpuwrap.mk b/package/libfslvpuwrap/libfslvpuwrap.mk
> index 75c9887..2299032 100644
> --- a/package/libfslvpuwrap/libfslvpuwrap.mk
> +++ b/package/libfslvpuwrap/libfslvpuwrap.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBFSLVPUWRAP_VERSION = $(FREESCALE_IMX_VERSION)
> +LIBFSLVPUWRAP_VERSION = 3.5.7-1.0.0
>  LIBFSLVPUWRAP_SITE = $(FREESCALE_IMX_SITE)
>  LIBFSLVPUWRAP_SOURCE = libfslvpuwrap-$(LIBFSLVPUWRAP_VERSION).bin
>  LIBFSLVPUWRAP_LICENSE = Freescale Semiconductor Software License Agreement
> -- 
> 2.0.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
