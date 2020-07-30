From: =?UTF-8?Q?Bartosz_Bi=c5=82as?= <b.bilas@grinn-global.com>
Date: Thu, 30 Jul 2020 11:38:06 +0200
Subject: [Buildroot] [PATCH] package/imx-mkimage: bump to version
 rel_imx_5.4.24_2.1.0
In-Reply-To: <20200727133131.31219-1-b.bilas@grinn-global.com>
References: <20200727133131.31219-1-b.bilas@grinn-global.com>
Message-ID: <3cc2534a-7d99-73d2-a484-c0093d6be82c@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone,

On 7/27/20 3:31 PM, Bartosz Bilas wrote:
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>   package/imx-mkimage/imx-mkimage.hash | 2 +-
>   package/imx-mkimage/imx-mkimage.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/imx-mkimage/imx-mkimage.hash b/package/imx-mkimage/imx-mkimage.hash
> index 6d5a329ed5..7ceeee25c1 100644
> --- a/package/imx-mkimage/imx-mkimage.hash
> +++ b/package/imx-mkimage/imx-mkimage.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256 a7e4c1c45b0d36e088bd7891335aa3c726682750984b7ca072e3c6329def92cf  imx-mkimage-rel_imx_4.19.35_1.1.0.tar.gz
> +sha256 0888a470367914350be0dabf84e97e1e71c688e2cc80e3ba79f7a23dc3446851  imx-mkimage-rel_imx_5.4.24_2.1.0.tar.gz
>   sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
> diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
> index ed0e435a73..6501d3f18c 100644
> --- a/package/imx-mkimage/imx-mkimage.mk
> +++ b/package/imx-mkimage/imx-mkimage.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -IMX_MKIMAGE_VERSION = rel_imx_4.19.35_1.1.0
> +IMX_MKIMAGE_VERSION = rel_imx_5.4.24_2.1.0
>   IMX_MKIMAGE_SITE = https://source.codeaurora.org/external/imx/imx-mkimage
>   IMX_MKIMAGE_SITE_METHOD = git
>   IMX_MKIMAGE_LICENSE = GPL-2.0+

I guess that someone has forgotten to commit these changes because that 
is already accepted on the patchwork.

Best
Bartek
