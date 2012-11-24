From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 24 Nov 2012 21:42:21 +0100
Subject: [Buildroot] [PATCH 27/33] imagemagick: add license info
In-Reply-To: <1353543503-8952-28-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-28-git-send-email-s.martin49@gmail.com>
Message-ID: <50B1312D.6070405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/11/12 01:18, Samuel Martin wrote:
>
> Signed-off-by: Samuel Martin<s.martin49@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout

> ---
>   package/imagemagick/imagemagick.mk | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
> index 365a073..725e529 100644
> --- a/package/imagemagick/imagemagick.mk
> +++ b/package/imagemagick/imagemagick.mk
> @@ -11,6 +11,9 @@ IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.bz2
>   # available, which is annoying. Use an alternate site that keeps all
>   # older versions.
>   IMAGEMAGICK_SITE = ftp://ftp.nluug.nl/pub/ImageMagick/
> +IMAGEMAGICK_LICENSE = Apache-v2
> +IMAGEMAGICK_LICENSE_FILES = LICENSE
> +
>   IMAGEMAGICK_INSTALL_STAGING = YES
>   IMAGEMAGICK_AUTORECONF = YES
>

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
