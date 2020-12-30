From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Dec 2020 21:30:22 +0100
Subject: [Buildroot] [PATCH 1/1] package/ethtool: bump version to 5.10
In-Reply-To: <20201230125117.11324-1-heiko.thiery@gmail.com>
References: <20201230125117.11324-1-heiko.thiery@gmail.com>
Message-ID: <20201230203022.GB2902@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2020-12-30 13:51 +0100, Heiko Thiery spake thusly:
> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/ethtool/ethtool.hash | 2 +-
>  package/ethtool/ethtool.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
> index f4503ef907..0104287d3d 100644
> --- a/package/ethtool/ethtool.hash
> +++ b/package/ethtool/ethtool.hash
> @@ -1,5 +1,5 @@
>  # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
> -sha256  512932010af87bc3e09773c89baea44bca96c1da1151bbcf109fa0e055a88a6f  ethtool-5.9.tar.xz
> +sha256  817d5396a9307b4c637b435d4c558b8f5f964a1464a035ca3c0180f4cc93cfcf  ethtool-5.10.tar.xz
>  # Locally calculated
>  sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256	5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1  LICENSE
> diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
> index 7d82386ebe..e1bdd370b0 100644
> --- a/package/ethtool/ethtool.mk
> +++ b/package/ethtool/ethtool.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ETHTOOL_VERSION = 5.9
> +ETHTOOL_VERSION = 5.10
>  ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
>  ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
>  ETHTOOL_LICENSE = GPL-2.0
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
