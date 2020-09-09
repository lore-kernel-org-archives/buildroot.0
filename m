From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 9 Sep 2020 20:28:14 +0200
Subject: [Buildroot] [PATCH 1/2] package/ell: bump to 0.33
In-Reply-To: <20200909005214.888612-1-m.niestroj@grinn-global.com>
References: <20200909005214.888612-1-m.niestroj@grinn-global.com>
Message-ID: <20200909202814.0ec389fd@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marcin,

On Wed,  9 Sep 2020 02:52:13 +0200, Marcin Niestroj <m.niestroj@grinn-global.com> wrote:

> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  package/ell/ell.hash | 2 +-
>  package/ell/ell.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/ell/ell.hash b/package/ell/ell.hash
> index c151812232..43324e658d 100644
> --- a/package/ell/ell.hash
> +++ b/package/ell/ell.hash
> @@ -1,5 +1,5 @@
>  # Locally computed
> -sha256  50ead312a290f44808fd5fcb4f8495b20ab16511d0b76f6d33db186b87c608a1  ell-0.32.tar.gz
> +sha256  fc3fd66739008fabf4b62f8bc1b37110cc44b9e8233c34f8d991939d0e0247b6  ell-0.33.tar.gz
>
>  # License files
>  sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
> diff --git a/package/ell/ell.mk b/package/ell/ell.mk
> index 6c265b93ab..f35c022503 100644
> --- a/package/ell/ell.mk
> +++ b/package/ell/ell.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -ELL_VERSION = 0.32
> +ELL_VERSION = 0.33
>  ELL_SITE = https://git.kernel.org/pub/scm/libs/ell/ell.git
>  ELL_SITE_METHOD = git
>  ELL_LICENSE = LGPL-2.1+

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter
