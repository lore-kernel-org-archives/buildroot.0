From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 9 Nov 2020 20:11:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/fbgrab: bump to version 1.4
In-Reply-To: <1604926605-27217-1-git-send-email-timo.ketola@exertus.fi>
References: <1604926605-27217-1-git-send-email-timo.ketola@exertus.fi>
Message-ID: <20201109201145.29fe1bcc@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Timo,

On Mon,  9 Nov 2020 14:56:45 +0200, Timo Ketola <timo.ketola@exertus.fi> wrote:

> Add support for line length deviating from width
>
> Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>
> ---
>  package/fbgrab/fbgrab.hash | 2 +-
>  package/fbgrab/fbgrab.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/fbgrab/fbgrab.hash b/package/fbgrab/fbgrab.hash
> index 414a93c..4d9a6b9 100644
> --- a/package/fbgrab/fbgrab.hash
> +++ b/package/fbgrab/fbgrab.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  2bfdad379579c4ca1a910d0a8ac63183ef2c12a45e6b7d402fd045d83bb3faee  fbgrab-1.3.3.tar.gz
> +sha256  62d7aa82138ac36db0921832f3b5267b4cffc0dc22c8701857ebcb997960a32e  fbgrab-1.4.tar.gz
>  sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  COPYING
> diff --git a/package/fbgrab/fbgrab.mk b/package/fbgrab/fbgrab.mk
> index 6d2f09b..1ae03ae 100644
> --- a/package/fbgrab/fbgrab.mk
> +++ b/package/fbgrab/fbgrab.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -FBGRAB_VERSION = 1.3.3
> +FBGRAB_VERSION = 1.4
>  FBGRAB_SITE = $(call github,GunnarMonell,fbgrab,$(FBGRAB_VERSION))
>  FBGRAB_DEPENDENCIES = libpng
>  FBGRAB_LICENSE = GPL-2.0

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter
