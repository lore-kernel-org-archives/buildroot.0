From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 9 Mar 2018 08:28:10 -0500
Subject: [Buildroot] [PATCH 1/1] libmpdclient: add host-meson dependency
In-Reply-To: <20180308165006.10903-1-fontaine.fabrice@gmail.com>
References: <20180308165006.10903-1-fontaine.fabrice@gmail.com>
Message-ID: <CAFSsvmoVtUXzKC75L4hfyQ=p-62W58_Q9ibCQ9e95=zD_Kh4sQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All;

On Thu, Mar 8, 2018 at 11:50 AM, Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
> Fixes:
>  - http://autobuild.buildroot.net/results/00a/00af3302c4029670a585beb3cb65bd8623cf12da
>
> Add a libmpdclient entry for myself in DEVELOPERS
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  DEVELOPERS                           | 1 +
>  package/libmpdclient/libmpdclient.mk | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 625fafc686..8e8ed14cd4 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -653,6 +653,7 @@ F:  package/gupnp-tools/
>  F:     package/hiredis/
>  F:     package/i2pd/
>  F:     package/igd2-for-linux/
> +F:     package/libmpdclient/
>  F:     package/libupnp/
>  F:     package/libupnp18/
>  F:     package/minissdpd/
> diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
> index 10281391aa..96e1f783fb 100644
> --- a/package/libmpdclient/libmpdclient.mk
> +++ b/package/libmpdclient/libmpdclient.mk
> @@ -11,6 +11,7 @@ LIBMPDCLIENT_SITE = http://www.musicpd.org/download/libmpdclient/$(LIBMPDCLIENT_
>  LIBMPDCLIENT_INSTALL_STAGING = YES
>  LIBMPDCLIENT_LICENSE = BSD-3-Clause
>  LIBMPDCLIENT_LICENSE_FILES = COPYING
> +LIBMPDCLIENT_DEPENDENCIES = host-meson
>
>  LIBMPDCLIENT_CONF_OPTS += \
>         --prefix=/usr \
> --
> 2.14.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Tested-by: Adam Duskett <aduskett@gmail.com>
