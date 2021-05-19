From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 12:52:42 +0200
Subject: [Buildroot] [PATCH] package/libmdbx: bump version to 0.10.0
In-Reply-To: <20210509195650.58816-1-leo@yuriev.ru>
References: <20210509195650.58816-1-leo@yuriev.ru>
Message-ID: <20210519105242.GS2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Leonid, All,

On 2021-05-09 22:56 +0300, Leonid Yuriev spake thusly:
> Release notes: https://github.com/erthink/libmdbx/releases/tag/v0.10.0
> 
> Signed-off-by: Leonid Yuriev <leo@yuriev.ru>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libmdbx/libmdbx.hash | 2 +-
>  package/libmdbx/libmdbx.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libmdbx/libmdbx.hash b/package/libmdbx/libmdbx.hash
> index fcfb4a673f..8ff8e99810 100644
> --- a/package/libmdbx/libmdbx.hash
> +++ b/package/libmdbx/libmdbx.hash
> @@ -1,5 +1,5 @@
>  # Hashes from: https://github.com/erthink/libmdbx/releases/
> -sha256  d12bc7189b746beaa85514fcd1fcf26b957bb8feadb11662a0e20c4e79410d3f  libmdbx-amalgamated-0.9.3.tar.gz
> +sha256  767776d961fadeb51ee895fb70ed82a03051bae855a19396f0067b03076103bb  libmdbx-amalgamated-0.10.0.tar.gz
>  
>  # Locally calculated
>  sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
> diff --git a/package/libmdbx/libmdbx.mk b/package/libmdbx/libmdbx.mk
> index baf5193eb6..8e2eff0c7f 100644
> --- a/package/libmdbx/libmdbx.mk
> +++ b/package/libmdbx/libmdbx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBMDBX_VERSION = 0.9.3
> +LIBMDBX_VERSION = 0.10.0
>  LIBMDBX_SOURCE = libmdbx-amalgamated-$(LIBMDBX_VERSION).tar.gz
>  LIBMDBX_SITE = https://github.com/erthink/libmdbx/releases/download/v$(LIBMDBX_VERSION)
>  LIBMDBX_SUPPORTS_IN_SOURCE_BUILD = NO
> -- 
> 2.31.1
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
