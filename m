From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 21:05:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/glorytun: bump version to 0.2.0
In-Reply-To: <20190921083433.23676-1-adrien@gallouet.fr>
References: <20190921083433.23676-1-adrien@gallouet.fr>
Message-ID: <3487905b-856d-96e5-3867-c402393cf7af@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/09/2019 10:34, Adrien Gallou?t wrote:
> The hash of the license file has changed due to the name:
> -Copyright (c) 2015-2019, angt
> +Copyright (c) 2015-2019, Adrien Gallou?t <adrien@gallouet.fr>
> 
> Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>

 Applied to master, thanks. Thank you for mentioning the license hash update in
the commit message.

 Regards,
 Arnout

> ---
>  package/glorytun/glorytun.hash | 4 ++--
>  package/glorytun/glorytun.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/glorytun/glorytun.hash b/package/glorytun/glorytun.hash
> index 85ae338c48..fc322993e5 100644
> --- a/package/glorytun/glorytun.hash
> +++ b/package/glorytun/glorytun.hash
> @@ -1,2 +1,2 @@
> -sha256 65adee2945f377ec41c1384745d5676c99768bba8fd4456755ee4c7d73915ede  glorytun-0.1.0.tar.gz
> -sha256 051ef5a4c3c8fe64f8641e0ed50b4cd35c64703d972130f9725c8fee7976f90b  LICENSE
> +sha256 e6c8a632acea5470787739f27914a729d9b4be74748ca9ee59079ceeb49b0002  glorytun-0.2.0.tar.gz
> +sha256 02e492aa724ce3a64800ed9429cbabf811935ad1be95d667fae9187baa94e359  LICENSE
> diff --git a/package/glorytun/glorytun.mk b/package/glorytun/glorytun.mk
> index 9fed5d260d..dc9f1b37b8 100644
> --- a/package/glorytun/glorytun.mk
> +++ b/package/glorytun/glorytun.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GLORYTUN_VERSION = 0.1.0
> +GLORYTUN_VERSION = 0.2.0
>  GLORYTUN_SITE = https://github.com/angt/glorytun/releases/download/v$(GLORYTUN_VERSION)
>  GLORYTUN_DEPENDENCIES = libsodium host-pkgconf
>  GLORYTUN_LICENSE = BSD-2-clause
> 
