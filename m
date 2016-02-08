From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Feb 2016 19:46:34 +0100
Subject: [Buildroot] [PATCH 1/1] imagemagick: bump version to 6.9.3-3
In-Reply-To: <1454909812-32383-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1454909812-32383-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <20160208184634.GF3436@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2016-02-08 03:36 -0200, Ricardo Martincoski spake thusly:
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Cc: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> ---
> Previous version IS working, but it depends on
> http://sources.buildroot.net/
> 
> Previous version was released less than a month ago.
> But now its tarball got removed from the upstream download page
> ---
>  package/imagemagick/imagemagick.hash | 2 +-
>  package/imagemagick/imagemagick.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
> index 1d5794f..31ddfd2 100644
> --- a/package/imagemagick/imagemagick.hash
> +++ b/package/imagemagick/imagemagick.hash
> @@ -1,2 +1,2 @@
>  # From http://www.imagemagick.org/download/releases/digest.rdf
> -sha256	78a9bfc581c81fb8376c00d06431b49f218d3900690905dc985459cbf5e41c4d	ImageMagick-6.9.3-2.tar.xz
> +sha256	d127f76c674f1454adf0444ecec96f344c3dca522cc3320f0ef88d8060123048	ImageMagick-6.9.3-3.tar.xz
> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
> index 76061fa..eee567e 100644
> --- a/package/imagemagick/imagemagick.mk
> +++ b/package/imagemagick/imagemagick.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IMAGEMAGICK_VERSION = 6.9.3-2
> +IMAGEMAGICK_VERSION = 6.9.3-3

Since you seem to be interested in ImageMagick, could you check what
that patch is all about and if it is still relevant:

    https://patchwork.ozlabs.org/patch/484767/

Thanks! :-)

Regards,
Yann E. MORIN.

>  IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.xz
>  IMAGEMAGICK_SITE = http://www.imagemagick.org/download/releases
>  IMAGEMAGICK_LICENSE = Apache-2.0
> -- 
> 1.9.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
