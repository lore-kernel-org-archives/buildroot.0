From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 13 Feb 2014 16:03:11 -0600
Subject: [Buildroot] [PATCH 1/1] ti-gfx: bump to version 5_01_00_01
In-Reply-To: <52fd38fd.870eec0a.7f7f.13a5@mx.google.com>
References: <52fd38fd.870eec0a.7f7f.13a5@mx.google.com>
Message-ID: <CAEBucnAUUP3==KSjx_uXZpcjfk9KNwOQqhQ0Eb-hu2+J7wfcKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 13, 2014 at 12:38 PM,  <kuyurix@gmail.com> wrote:
> From: Marcelo Gutierrez <kuyurix@gmail.com>
>
>
> Signed-off-by: Marcelo Gutierrez <kuyurix@gmail.com>
> ---
>  package/ti-gfx/ti-gfx.mk |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
> index a94f00d..5ea6b92 100644
> --- a/package/ti-gfx/ti-gfx.mk
> +++ b/package/ti-gfx/ti-gfx.mk
> @@ -4,13 +4,13 @@
>  #
>  ################################################################################
>
> -TI_GFX_VERSION = 4_09_00_01
> -TI_GFX_SO_VERSION = 1.9.2188537
> +TI_GFX_VERSION = 5_01_00_01
> +TI_GFX_SO_VERSION = 1.10.2359475
>
>  ifeq ($(BR2_ARM_EABIHF),y)
> -TI_GFX_SOURCE = Graphics_SDK_setuplinux_$(TI_GFX_VERSION)_hardfp_minimal_demos.bin
> +TI_GFX_SOURCE = Graphics_SDK_setuplinux_hardfp_$(TI_GFX_VERSION).bin
>  else
> -TI_GFX_SOURCE = Graphics_SDK_setuplinux_$(TI_GFX_VERSION)_minimal_demos.bin
> +TI_GFX_SOURCE = Graphics_SDK_setuplinux_softfp_$(TI_GFX_VERSION).bin
>  endif
>
>  TI_GFX_SITE = http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/$(TI_GFX_VERSION)/exports/
> --
> 1.7.9.5
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Marcelo Gutierrez,

Please see the following site.  The 5_01_00_01 version is not a
supported version; it is of alpha quality and has several
deficiencies.

http://tigraphics.blogspot.com/2013/11/4q-2013-linux-graphics-sdk-release.html

Thanks,
Spenser

-- 
Spenser Gilliland
Computer Engineer
Doctoral Candidate
