From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 2 Nov 2015 10:19:54 +0200
Subject: [Buildroot] [PATCH 1/1] imagemagick: bump to version 6.9.2-5
In-Reply-To: <1446452124-24789-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1446452124-24789-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20151102081954.GR3352@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerzy,

On Mon, Nov 02, 2015 at 09:15:24AM +0100, Jerzy Grzegorek wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> ---
>  package/imagemagick/imagemagick.hash | 2 +-
>  package/imagemagick/imagemagick.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
> index 716eaa7..0622ce2 100644
> --- a/package/imagemagick/imagemagick.hash
> +++ b/package/imagemagick/imagemagick.hash
> @@ -1,2 +1,2 @@
>  # From ftp://ftp.nluug.nl/pub/ImageMagick/digest.rdf

Unrelated to this patch I thing that we should point to 
http://www.imagemagick.org/download/releases/digest.rdf because that's our 
download location.

baruch

> -sha256	05b1c499415048099a1464ebd03f0cfaae8d0994c681bcf7e0319b26e5e8d848	ImageMagick-6.9.2-4.tar.xz
> +sha256 19fb341725a13c01458cfce23d0a260fd032432a5daeebdd4f06c92d716ded40 ImageMagick-6.9.2-5.tar.xz
> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
> index 3b96126..c149829 100644
> --- a/package/imagemagick/imagemagick.mk
> +++ b/package/imagemagick/imagemagick.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IMAGEMAGICK_VERSION = 6.9.2-4
> +IMAGEMAGICK_VERSION = 6.9.2-5
>  IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
>  IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
>  IMAGEMAGICK_LICENSE = Apache-2.0

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
