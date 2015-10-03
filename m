From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 3 Oct 2015 23:11:45 +0200
Subject: [Buildroot] [PATCH 06/18] imx-lib: remove now-redundant ccache
 handling
In-Reply-To: <1442774504-22799-7-git-send-email-arnout@mind.be>
References: <1442774504-22799-1-git-send-email-arnout@mind.be>
 <1442774504-22799-7-git-send-email-arnout@mind.be>
Message-ID: <56104491.5090406@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le 20/09/2015 20:41, Arnout Vandecappelle (Essensium/Mind) a ?crit :
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

You also need to remove now-redundant ccache handling in freescale-imx/imx-vpu
package.

Reviewed-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain

> ---
>  package/freescale-imx/imx-lib/imx-lib.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
> index 92739a8..7046580 100644
> --- a/package/freescale-imx/imx-lib/imx-lib.mk
> +++ b/package/freescale-imx/imx-lib/imx-lib.mk
> @@ -21,7 +21,7 @@ IMX_LIB_INCLUDE = \
>  IMX_LIB_MAKE_ENV = \
>  	$(TARGET_MAKE_ENV) \
>  	$(TARGET_CONFIGURE_OPTS) \
> -	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
> +	CROSS_COMPILE="$(TARGET_CROSS)" \
>  	PLATFORM=$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM) \
>  	INCLUDE="$(IMX_LIB_INCLUDE)"
>  
> 
