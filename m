From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Sun, 24 Jan 2016 20:53:45 +0100
Subject: [Buildroot] [PATCH] package/imx-lib: fix legal-info
In-Reply-To: <1453664245-20137-1-git-send-email-yann.morin.1998@free.fr>
References: <1453664245-20137-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAAMH-ytbxp0gJX_mUQ29ZOzQWebX6r35SvmG+zfZBhwfvdOGAw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

On Sun, Jan 24, 2016 at 8:37 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> The new version of imx-lib no longer bears the EULA file, and has no
> other license file.
>
> So, we pick a small header as the license file.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/freescale-imx/imx-lib/imx-lib.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
> index 7046580..e160cca 100644
> --- a/package/freescale-imx/imx-lib/imx-lib.mk
> +++ b/package/freescale-imx/imx-lib/imx-lib.mk
> @@ -7,7 +7,7 @@
>  IMX_LIB_VERSION = $(FREESCALE_IMX_VERSION)
>  IMX_LIB_SITE = $(FREESCALE_IMX_SITE)
>  IMX_LIB_LICENSE = LGPLv2.1+
> -IMX_LIB_LICENSE_FILES = EULA
> +IMX_LIB_LICENSE_FILES = pxp/pxp_lib.h
>
>  IMX_LIB_INSTALL_STAGING = YES
>
> --
> 1.9.1
>

Acked-by: Gary Bisson <gary.bisson@boundarydevices.com>

As a FYI, I plan on releasing a patch series to update all the
Freescale packages, and latest imx-lib has a COPYING file.
http://www.nxp.com/lgfiles/NMG/MAD/YOCTO/imx-lib-5.1.tar.gz

Regards,
Gary
