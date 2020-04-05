From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 5 Apr 2020 16:35:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: bump version to 3.1.3
In-Reply-To: <20200405120505.5594-1-zhaojh329@gmail.com>
References: <20200405120505.5594-1-zhaojh329@gmail.com>
Message-ID: <20200405163512.5390b234@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Jianhui,

On Sun,  5 Apr 2020 20:05:05 +0800, Jianhui Zhao <zhaojh329@gmail.com> wrote:

> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> ---
>  package/libuhttpd/libuhttpd.hash | 2 +-
>  package/libuhttpd/libuhttpd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
> index 65014cacf5..5c3359fdd3 100644
> --- a/package/libuhttpd/libuhttpd.hash
> +++ b/package/libuhttpd/libuhttpd.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256 9f938b75074f812375c5079189f8299c328e94801117ab1190a29fae0806f1a8  libuhttpd-3.1.2.tar.gz
> +sha256 272e64fab9932039366270efa49dd4df98f5ebe8c76e51ae578594b37bf6eef4  libuhttpd-3.1.3.tar.gz
>  sha256 99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
> diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
> index ce805e8f08..0d75176d41 100644
> --- a/package/libuhttpd/libuhttpd.mk
> +++ b/package/libuhttpd/libuhttpd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBUHTTPD_VERSION = 3.1.2
> +LIBUHTTPD_VERSION = 3.1.3
>  LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
>  LIBUHTTPD_LICENSE = MIT
>  LIBUHTTPD_LICENSE_FILES = LICENSE

Thanks for the update, one question:

From [1]:

 + check_library_exists(dl dlopenx "" HAVE_DLOPEN)

Would have expected dlopen (not dlopenx)?

Regards,
Peter

[1] https://github.com/zhaojh329/libuhttpd/commit/44b35fd253d9557c5c61beab80c8086042fc09df
