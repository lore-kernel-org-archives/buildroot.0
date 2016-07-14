From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 14 Jul 2016 13:31:27 +0300
Subject: [Buildroot] [PATCH] imagemagick: bump version to 7.0.2-4
In-Reply-To: <1468491969-30592-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1468491969-30592-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160714103127.GZ3870@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

On Thu, Jul 14, 2016 at 11:26:09AM +0100, Vicente Olivert Riera wrote:
> Option --disable-jp2 removed as it doesn't exist anymore.

You mean '--without-jp2'?

baruch

> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/imagemagick/imagemagick.hash | 2 +-
>  package/imagemagick/imagemagick.mk   | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
> index ef73b24..b04ecd5 100644
> --- a/package/imagemagick/imagemagick.hash
> +++ b/package/imagemagick/imagemagick.hash
> @@ -1,2 +1,2 @@
>  # From http://www.imagemagick.org/download/releases/digest.rdf
> -sha256 a4420a125609d6cac2fbc141a291bbf143d71bd15e21c09946fdf98f90247225  ImageMagick-7.0.2-1.tar.xz
> +sha256 3d870568432520095755fad9bb29b332351c7e25061d5d7d44873accc0eb08fe  ImageMagick-7.0.2-4.tar.xz
> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
> index 864e033..ae6c62a 100644
> --- a/package/imagemagick/imagemagick.mk
> +++ b/package/imagemagick/imagemagick.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IMAGEMAGICK_VERSION = 7.0.2-1
> +IMAGEMAGICK_VERSION = 7.0.2-4
>  IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
>  IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
>  IMAGEMAGICK_LICENSE = Apache-2.0
> @@ -30,7 +30,6 @@ IMAGEMAGICK_CONF_OPTS = \
>  	--without-gslib \
>  	--without-gvc \
>  	--without-jbig \
> -	--without-jp2 \
>  	--without-lqr \
>  	--without-openexr \
>  	--without-perl \

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
