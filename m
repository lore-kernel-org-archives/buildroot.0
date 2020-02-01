From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Feb 2020 00:10:02 +0100
Subject: [Buildroot] [PATCH] package/lighttpd: bump to version 1.4.55
In-Reply-To: <20200201230521.17879-1-peter@korsgaard.com>
References: <20200201230521.17879-1-peter@korsgaard.com>
Message-ID: <20200201231002.GD21372@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-02-02 00:05 +0100, Peter Korsgaard spake thusly:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/lighttpd/lighttpd.hash | 4 ++--
>  package/lighttpd/lighttpd.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
> index e998738689..7f20bf9dce 100644
> --- a/package/lighttpd/lighttpd.hash
> +++ b/package/lighttpd/lighttpd.hash
> @@ -1,4 +1,4 @@
> -# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.54.sha256sum
> -sha256 cf14cce2254a96d8fcb6d3181e1a3c29a8f832531c3e86ff6f2524ecda9a8721  lighttpd-1.4.54.tar.xz
> +# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.55.sha256sum
> +sha256 6a0b50e9c9d5cc3d9e48592315c25a2d645858f863e1ccd120507a30ce21e927  lighttpd-1.4.55.tar.xz
>  # Locally calculated
>  sha256 5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
> diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
> index d7622ad822..7181465c66 100644
> --- a/package/lighttpd/lighttpd.mk
> +++ b/package/lighttpd/lighttpd.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIGHTTPD_VERSION_MAJOR = 1.4
> -LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).54
> +LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).55
>  LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
>  LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
>  LIGHTTPD_LICENSE = BSD-3-Clause
> -- 
> 2.20.1
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
