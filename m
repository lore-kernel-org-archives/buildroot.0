From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 8 May 2018 23:43:45 +0200
Subject: [Buildroot] [PATCH 2/2] zstd: bump to version 1.3.4
In-Reply-To: <c4d659d810a4d47b42546d74a013f01ac7f62cba.1525803977.git.baruch@tkos.co.il>
References: <d9cdc06bb6718534ed51a927f7adeab442a4e110.1525803977.git.baruch@tkos.co.il>
 <c4d659d810a4d47b42546d74a013f01ac7f62cba.1525803977.git.baruch@tkos.co.il>
Message-ID: <20180508234345.1e54ce73@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Tue,  8 May 2018 21:26:17 +0300, Baruch Siach <baruch@tkos.co.il> wrote:

> Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/zstd/zstd.hash | 2 +-
>  package/zstd/zstd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
> index 51e5fc245ca3..f7aadfb5db75 100644
> --- a/package/zstd/zstd.hash
> +++ b/package/zstd/zstd.hash
> @@ -1,5 +1,5 @@
>  # Locally computed
> -sha256 a77c47153ee7de02626c5b2a097005786b71688be61e9fb81806a011f90b297b zstd-v1.3.3.tar.gz
> +sha256 92e41b6e8dd26bbd46248e8aa1d86f1551bc221a796277ae9362954f26d605a9 zstd-v1.3.4.tar.gz
>  
>  # License files (locally computed as well)
>  sha256 2c1a7fa704df8f3a606f6fc010b8b5aaebf403f3aeec339a12048f1ba7331a0b LICENSE
> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> index c74c8f24b63f..4915cee07d50 100644
> --- a/package/zstd/zstd.mk
> +++ b/package/zstd/zstd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ZSTD_VERSION = v1.3.3
> +ZSTD_VERSION = v1.3.4
>  ZSTD_SITE = $(call github,facebook,zstd,$(ZSTD_VERSION))
>  ZSTD_INSTALL_STAGING = YES
>  ZSTD_LICENSE = BSD-3-Clause or GPL-2.0

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter
