From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 14:30:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/ethtool: bump to version 5.12
In-Reply-To: <20210517082252.30150-1-heiko.thiery@gmail.com>
References: <20210517082252.30150-1-heiko.thiery@gmail.com>
Message-ID: <20210518123025.GF2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2021-05-17 10:22 +0200, Heiko Thiery spake thusly:
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ethtool/ethtool.hash | 2 +-
>  package/ethtool/ethtool.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
> index 334ff8d503..536579670f 100644
> --- a/package/ethtool/ethtool.hash
> +++ b/package/ethtool/ethtool.hash
> @@ -1,5 +1,5 @@
>  # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
> -sha256  817d5396a9307b4c637b435d4c558b8f5f964a1464a035ca3c0180f4cc93cfcf  ethtool-5.10.tar.xz
> +sha256  f5ddfa9c75053d8011b8c8c99ec4e2d3c83cd1972f638692d62e37fa3ef36f07  ethtool-5.12.tar.xz
>  # Locally calculated
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1  LICENSE
> diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
> index c9765eccff..f3e950f212 100644
> --- a/package/ethtool/ethtool.mk
> +++ b/package/ethtool/ethtool.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ETHTOOL_VERSION = 5.10
> +ETHTOOL_VERSION = 5.12
>  ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
>  ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
>  ETHTOOL_LICENSE = GPL-2.0
> -- 
> 2.30.0
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
