From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Fri, 18 Sep 2020 18:02:04 +0300
Subject: [Buildroot] [PATCH v1] package/acpica: bump version to 20200717
In-Reply-To: <20200909191711.69977-1-andriy.shevchenko@linux.intel.com>
References: <20200909191711.69977-1-andriy.shevchenko@linux.intel.com>
Message-ID: <20200918150204.GH3956970@smile.fi.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 09, 2020 at 10:17:11PM +0300, Andy Shevchenko wrote:
> Fixes:
> 	https://github.com/acpica/acpica/issues/630

Guys, can this be pushed to BR repo? It's really nasty bug in the tools this
update fixes.

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  package/acpica/acpica.hash | 2 +-
>  package/acpica/acpica.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/acpica/acpica.hash b/package/acpica/acpica.hash
> index 961ee9dbe3ce..a2fdfe602e06 100644
> --- a/package/acpica/acpica.hash
> +++ b/package/acpica/acpica.hash
> @@ -1,3 +1,3 @@
>  # locally computed hash
> -sha256  ad8a7b1571ec94d8c1837cf0c89ff33ea820780362fbb3e26adbde96beed5205  acpica-unix2-20200528.tar.gz
> +sha256  8a49904744a8159b7f325ed941b56968ba37a0371c634036628064f97538de4b  acpica-unix2-20200717.tar.gz
>  sha256  cb17c679d3291eba1a70a1336062fb07eec2e839b0821b443b24f41de18c5218  source/include/acpi.h
> diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
> index 8f1a36fbb70a..21ecc155be2a 100644
> --- a/package/acpica/acpica.mk
> +++ b/package/acpica/acpica.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ACPICA_VERSION = 20200528
> +ACPICA_VERSION = 20200717
>  ACPICA_SOURCE = acpica-unix2-$(ACPICA_VERSION).tar.gz
>  ACPICA_SITE = https://acpica.org/sites/acpica/files
>  ACPICA_LICENSE = BSD-3-Clause or GPL-2.0
> -- 
> 2.28.0
> 

-- 
With Best Regards,
Andy Shevchenko
