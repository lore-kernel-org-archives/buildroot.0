From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Apr 2020 12:16:48 +0200
Subject: [Buildroot] [PATCH] package/e2fsprogs: bump to version 1.45.6
In-Reply-To: <20200425220154.18496-1-ryanbarnett3@gmail.com>
References: <20200425220154.18496-1-ryanbarnett3@gmail.com>
Message-ID: <20200426101648.GZ5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ryan, All,

On 2020-04-25 17:01 -0500, Ryan Barnett spake thusly:
> Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/e2fsprogs/e2fsprogs.hash | 4 ++--
>  package/e2fsprogs/e2fsprogs.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
> index 3ecbe4eaa7..b563af27f2 100644
> --- a/package/e2fsprogs/e2fsprogs.hash
> +++ b/package/e2fsprogs/e2fsprogs.hash
> @@ -1,5 +1,5 @@
> -# https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.45.5/sha256sums.asc
> -sha256  f9faccc0d90f73556e797dc7cc5979b582bd50d3f8609c0f2ad48c736d44aede  e2fsprogs-1.45.5.tar.xz
> +# https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.45.6/sha256sums.asc
> +sha256  ffa7ae6954395abdc50d0f8605d8be84736465afc53b8938ef473fcf7ff44256  e2fsprogs-1.45.6.tar.xz
>  # Locally calculated
>  sha256  5da5ef153e559c1d990d4c3eedbedd4442db892d37eae1f35fff069de8ec9020  NOTICE
>  sha256  032989b508f1a72ebee5b3417e55d06d473f9ee203e45ab11864a7e49cdec63d  lib/ss/mit-sipb-copyright.h
> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
> index fd59f701d6..41986eec58 100644
> --- a/package/e2fsprogs/e2fsprogs.mk
> +++ b/package/e2fsprogs/e2fsprogs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -E2FSPROGS_VERSION = 1.45.5
> +E2FSPROGS_VERSION = 1.45.6
>  E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
>  E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
>  E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
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
