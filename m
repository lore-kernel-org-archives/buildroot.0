From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 14:01:05 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/libdrm: bump version to
 2.4.106
In-Reply-To: <20210518044626.17073-1-bernd.kuhls@t-online.de>
References: <20210518044626.17073-1-bernd.kuhls@t-online.de>
Message-ID: <20210518120105.GB2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-05-18 06:46 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
[--SNIP--]
> diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
> index f5b205bb00..f18df27687 100644
> --- a/package/libdrm/libdrm.mk
> +++ b/package/libdrm/libdrm.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBDRM_VERSION = 2.4.105
> +LIBDRM_VERSION = 2.4.106

You tagged that one for next, but this is actually a minor release that
fixes a regression, and adds just a bunch of tests and debug here and
there....

Is there a reason why that can't be applied to master?

Regards,
Yann E. MORIN.

>  LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
>  LIBDRM_SITE = https://dri.freedesktop.org/libdrm
>  LIBDRM_LICENSE = MIT
> -- 
> 2.29.2
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
