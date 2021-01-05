From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 5 Jan 2021 12:31:16 +0100
Subject: [Buildroot] [PATCH 4/8] package/imx-mkimage: bump to version
 rel_imx_5.4.70_2.3.0
In-Reply-To: <20210104173820.6720-5-stephane.viau@oss.nxp.com>
References: <20210104173820.6720-1-stephane.viau@oss.nxp.com>
 <20210104173820.6720-5-stephane.viau@oss.nxp.com>
Message-ID: <X/ROBI7FTzIcE0Jy@p1g2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stephane,

On Mon, Jan 04, 2021 at 06:38:16PM +0100, Stephane Viau wrote:
> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
> ---
>  package/imx-mkimage/imx-mkimage.hash | 2 +-
>  package/imx-mkimage/imx-mkimage.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/imx-mkimage/imx-mkimage.hash b/package/imx-mkimage/imx-mkimage.hash
> index e06706070d..4d3af3cd95 100644
> --- a/package/imx-mkimage/imx-mkimage.hash
> +++ b/package/imx-mkimage/imx-mkimage.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256 19745a7b9d06a420e7574328de65e6f5f7e82c87beed926c8f0f6bd1512afbe6  imx-mkimage-rel_imx_5.4.47_2.2.0.tar.gz
> +sha256 26175ee0634bc07efe7fa64e306f8241919ed9fbea92dfd8881ffd05c1783f5a  imx-mkimage-rel_imx_5.4.70_2.3.0.tar.gz
>  sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
> diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
> index 51eb79e5f5..626e3d873f 100644
> --- a/package/imx-mkimage/imx-mkimage.mk
> +++ b/package/imx-mkimage/imx-mkimage.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IMX_MKIMAGE_VERSION = rel_imx_5.4.47_2.2.0
> +IMX_MKIMAGE_VERSION = rel_imx_5.4.70_2.3.0
>  IMX_MKIMAGE_SITE = https://source.codeaurora.org/external/imx/imx-mkimage
>  IMX_MKIMAGE_SITE_METHOD = git
>  IMX_MKIMAGE_LICENSE = GPL-2.0+

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Thanks,
Gary
