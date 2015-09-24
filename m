From: =?UTF-8?Q?Beno=c3=aet_Th=c3=a9baudeau?= <benoit@wsystem.com>
Date: Thu, 24 Sep 2015 11:25:35 +0200
Subject: [Buildroot] [PATCH] package/genimage: bump version to 8
In-Reply-To: <1443086443-107037-1-git-send-email-benoit@wsystem.com>
References: <1443086443-107037-1-git-send-email-benoit@wsystem.com>
Message-ID: <5603C18F.5040008@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/09/2015 11:20, Beno?t Th?baudeau wrote:
> This new version fixes segmentation faults on some platforms.
> 
> Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
> ---
>  package/genimage/genimage.hash | 2 +-
>  package/genimage/genimage.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/genimage/genimage.hash b/package/genimage/genimage.hash
> index 71b7601..b01ea46 100644
> --- a/package/genimage/genimage.hash
> +++ b/package/genimage/genimage.hash
> @@ -1,2 +1,2 @@
>  # Locally calculated
> -sha256	7366dcfe4c542298ffe8a6c8d3551b1c3a84e25bfbb76ca75b9692e974f4534a	genimage-7.tar.xz
> +sha256	363b2222b8036eca927c464994e7a877539adc3ea9ba895c1e2186f0589fafbf	genimage-8.tar.xz
> diff --git a/package/genimage/genimage.mk b/package/genimage/genimage.mk
> index 07d95a4..2dffbc5 100644
> --- a/package/genimage/genimage.mk
> +++ b/package/genimage/genimage.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GENIMAGE_VERSION = 7
> +GENIMAGE_VERSION = 8
>  GENIMAGE_SOURCE = genimage-$(GENIMAGE_VERSION).tar.xz
>  GENIMAGE_SITE = http://www.pengutronix.de/software/genimage/download
>  GENIMAGE_DEPENDENCIES = host-pkgconf libconfuse

I have successfully tested this with my RPi series using genimage.

Best regards,
Beno?t
