From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 18 Jan 2017 23:19:08 +0100
Subject: [Buildroot] [PATCH] package/xcb-util: remove obsolete
	dependency on gperf
In-Reply-To: <20170118111716.12640-1-alvaro.gamez@hazent.com>
References: <20170118111716.12640-1-alvaro.gamez@hazent.com>
Message-ID: <2ab19626-86e2-ed99-09ae-a17c9a0c2a9a@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alvaro,

Le 18/01/2017 ? 12:17, Alvaro Gamez Machado a ?crit :
> Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>

Indeed, gperf dependency was removed with 0.3.9 xcb-util release.

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
>  package/x11r7/xcb-util/xcb-util.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/x11r7/xcb-util/xcb-util.mk b/package/x11r7/xcb-util/xcb-util.mk
> index 4416d8075..7b913e2bb 100644
> --- a/package/x11r7/xcb-util/xcb-util.mk
> +++ b/package/x11r7/xcb-util/xcb-util.mk
> @@ -12,6 +12,6 @@ XCB_UTIL_SITE = http://xcb.freedesktop.org/dist
>  XCB_UTIL_LICENSE = MIT
>  
>  XCB_UTIL_INSTALL_STAGING = YES
> -XCB_UTIL_DEPENDENCIES = host-gperf libxcb
> +XCB_UTIL_DEPENDENCIES = libxcb
>  
>  $(eval $(autotools-package))
> 
