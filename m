From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Oct 2019 18:30:36 +0200
Subject: [Buildroot] [PATCH] package/meson: bump version to 0.52.0
In-Reply-To: <20191014130053.2061929-1-m.niestroj@grinn-global.com>
References: <20191014130053.2061929-1-m.niestroj@grinn-global.com>
Message-ID: <CADvTj4pVZ_GCimK2QUzZmqzGHAUTDRJdUqHCAxqB3+atYVF7TA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a duplicate of https://patchwork.ozlabs.org/patch/1176087/

On Mon, Oct 14, 2019 at 3:01 PM Marcin Niestroj
<m.niestroj@grinn-global.com> wrote:
>
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
>  package/meson/meson.hash | 4 ++--
>  package/meson/meson.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/meson/meson.hash b/package/meson/meson.hash
> index cfe859d2ee..26b1fc9bb2 100644
> --- a/package/meson/meson.hash
> +++ b/package/meson/meson.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -# https://github.com/mesonbuild/meson/releases/download/0.51.2/meson-0.51.2.tar.gz.asc
> -sha256 23688f0fc90be623d98e80e1defeea92bbb7103bf9336a5f5b9865d36e892d76 meson-0.51.2.tar.gz
> +# https://github.com/mesonbuild/meson/releases/download/0.52.0/meson-0.52.0.tar.gz.asc
> +sha256 d60f75f0dedcc4fd249dbc7519d6f3ce6df490033d276ef1cf27453ef4938d32 meson-0.52.0.tar.gz
>  sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
> diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> index a664c55f55..29a192c569 100644
> --- a/package/meson/meson.mk
> +++ b/package/meson/meson.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -MESON_VERSION = 0.51.2
> +MESON_VERSION = 0.52.0
>  MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
>  MESON_LICENSE = Apache-2.0
>  MESON_LICENSE_FILES = COPYING
> --
> 2.23.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
