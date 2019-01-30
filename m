From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 30 Jan 2019 07:51:01 +0200
Subject: [Buildroot] [PATCH] libtommath: bump to version 1.1.0
In-Reply-To: <20190129175721.7219-1-francois.perrad@gadz.org>
References: <20190129175721.7219-1-francois.perrad@gadz.org>
Message-ID: <20190130055101.clk2qvxuyxlxzcsw@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francois,

On Tue, Jan 29, 2019 at 06:57:21PM +0100, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/libtommath/libtommath.hash | 5 ++++-
>  package/libtommath/libtommath.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libtommath/libtommath.hash b/package/libtommath/libtommath.hash
> index 359dfeda3..75aa7c7f1 100644
> --- a/package/libtommath/libtommath.hash
> +++ b/package/libtommath/libtommath.hash
> @@ -1,2 +1,5 @@
>  # Locally computed
> -sha256 47032fb39d698ce4cf9c9c462c198e6b08790ce8203ad1224086b9b978636c69  ltm-1.0.1.tar.xz
> +sha256 90466c88783d1fe9f5c2364a69f5479f10d73ed616011be6196f35f7f1537ead  ltm-1.1.0.tar.xz
> +
> +# Hashes for license files:
> +sha256 2fa64b163659f41965c9815882a8296d3d03ff546b76153e11445f9bdecf955a  LICENSE
> diff --git a/package/libtommath/libtommath.mk b/package/libtommath/libtommath.mk
> index ceb2e6846..36e7a89e6 100644
> --- a/package/libtommath/libtommath.mk
> +++ b/package/libtommath/libtommath.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -LIBTOMMATH_VERSION = 1.0.1
> +LIBTOMMATH_VERSION = 1.1.0
>  LIBTOMMATH_SITE = https://github.com/libtom/libtommath/releases/download/v$(LIBTOMMATH_VERSION)
>  LIBTOMMATH_SOURCE = ltm-$(LIBTOMMATH_VERSION).tar.xz
> -LIBTOMMATH_LICENSE = WTFPL
> +LIBTOMMATH_LICENSE = Unlicense

Please mention in the commit log that the code changed license to "The 
Unlicense", which is public domain as far as I understand, IANAL.

>  LIBTOMMATH_LICENSE_FILES = LICENSE
>  LIBTOMMATH_INSTALL_STAGING = YES
>  LIBTOMMATH_INSTALL_TARGET = NO  # only static library

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
