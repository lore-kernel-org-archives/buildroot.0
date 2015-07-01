From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Jul 2015 23:26:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/eudev: bump version to 3.1.2
In-Reply-To: <1435780733-24093-1-git-send-email-bernd.kuhls@t-online.de>
References: <1435780733-24093-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150701212623.GB3730@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-07-01 21:58 +0200, Bernd Kuhls spake thusly:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, see a comment below...

> ---
>  package/eudev/eudev.hash |    2 +-
>  package/eudev/eudev.mk   |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
> index 7c750a9..06bedab 100644
> --- a/package/eudev/eudev.hash
> +++ b/package/eudev/eudev.hash
> @@ -1,2 +1,2 @@
>  # From http://dev.gentoo.org/~blueness/eudev/
> -md5	d8d6b2ae5c9a740967b1ae2dccbae95b	eudev-3.1.1.tar.gz
> +md5	07ab33fe310d250f06fc28f010e3fde2	eudev-3.1.2.tar.gz

It never occured to me that we only had an md5 for this. Usually, when
upstream only provides a weak hash like md5, we add a locally-computed
stronger hash, like sha256 (at least sha1).

Regards,
Yann E. MORIN.

> diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> index a97154c..87bce3e 100644
> --- a/package/eudev/eudev.mk
> +++ b/package/eudev/eudev.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EUDEV_VERSION = 3.1.1
> +EUDEV_VERSION = 3.1.2
>  EUDEV_SOURCE = eudev-$(EUDEV_VERSION).tar.gz
>  EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
>  EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
> -- 
> 1.7.10.4
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
