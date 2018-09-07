From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Fri, 7 Sep 2018 10:18:19 +0200
Subject: [Buildroot] imx-lib: bump to version used in 4.9.88-2.0.0_ga
In-Reply-To: <20180904212822.48852-1-1baldgeek@gmail.com>
References: <20180904212822.48852-1-1baldgeek@gmail.com>
Message-ID: <20180907081819.GA19147@g751.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dan,

Thanks for your patch.

On Tue, Sep 04, 2018 at 05:28:22PM -0400, Dan Riegsecker wrote:
> In the latest release from NXP, Yocto Rocko 4.9.88-2.0.0_ga,
> imx-lib was switched from a specific branch or tag release to the
> master branch and a specific commit. See the link below for
> reference.
> 
> https://source.codeaurora.org/external/imx/meta-fsl-bsp-release/commit/?h=rocko-4.9.88-2.0.0_ga&id=ded1a9ea3d723c56058524fc9ebd420a3510ae05
> 
> Signed-off-by: Dan Riegsecker <1baldgeek@gmail.com>

Looks good to me, the log is right, NXP isn't using tags for Linux
releases on this package (but does for Android for some reason).

Also made sure it built fine so:
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

> ---
>  package/freescale-imx/imx-lib/imx-lib.hash | 2 +-
>  package/freescale-imx/imx-lib/imx-lib.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/freescale-imx/imx-lib/imx-lib.hash b/package/freescale-imx/imx-lib/imx-lib.hash
> index b3fce59d53..abbf017459 100644
> --- a/package/freescale-imx/imx-lib/imx-lib.hash
> +++ b/package/freescale-imx/imx-lib/imx-lib.hash
> @@ -1,2 +1,2 @@
>  # locally computed
> -sha256 245ace9b2c50d6c13a804d9c4492a5a850c626e7537f0d0bad81670b2824892f  imx-lib-rel_imx_4.9.x_1.0.0_ga.tar.gz
> +sha256 ced5ad0a179887ef1dd93e8103a9ab7372017cc1c241d28cded164cdece4b918  imx-lib-3f777974c0c146817e2ff5cb0340ca66a1f99e57.tar.gz

Note for future patch: we should also include the hash for the COPYING
file to track license changes.

Regards,
Gary
