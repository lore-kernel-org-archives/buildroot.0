From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 19 Oct 2014 13:09:27 +0200
Subject: [Buildroot] [PATCH 2/2] geoip: Remove useless variable
In-Reply-To: <1413715784-17421-2-git-send-email-maxime.hadjinlian@gmail.com>
References: <1413715784-17421-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1413715784-17421-2-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <CAGduivzvXgryGEqGa_Zb=iAgFXEq3RAK8M-KW+biM40D+SuMsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a NAK, needs some more work since the packages has been bumped
and there is a release file.
Will come back with a new patch.

On Sun, Oct 19, 2014 at 12:49 PM, Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/geoip/geoip.mk | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/package/geoip/geoip.mk b/package/geoip/geoip.mk
> index 869cc5e..0a0dad0 100644
> --- a/package/geoip/geoip.mk
> +++ b/package/geoip/geoip.mk
> @@ -5,7 +5,6 @@
>  ################################################################################
>
>  GEOIP_VERSION = v1.6.0
> -GEOIP_SOURCE = GeoIP-$(GEOIP_VERSION).tar.gz
>  GEOIP_SITE = $(call github,maxmind,geoip-api-c,$(GEOIP_VERSION))
>  GEOIP_AUTORECONF = YES
>  GEOIP_INSTALL_STAGING = YES
> --
> 2.1.1
>
