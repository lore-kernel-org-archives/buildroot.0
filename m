From: Romain Naour <romain.naour@smile.fr>
Date: Sun, 30 Oct 2016 17:12:48 +0100
Subject: [Buildroot] [PATCH 00/10] core: add waf-package infra,
	convert packages
In-Reply-To: <cover.1477843328.git.yann.morin.1998@free.fr>
References: <cover.1477843328.git.yann.morin.1998@free.fr>
Message-ID: <adba05c8-5d13-7960-cce9-002353712fd8@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, All,

Le 30/10/2016 ? 17:02, Yann E. MORIN a ?crit :
> Hello All!
> 
> This series introduces the waf-package infrastructure for packages based
> on the Waf buildsystem.
> 
> Then, packages using Waf are converted to use this new infra, except for
> samba4 which only uses it for configure, not for build.
> 
> The converted packages still build fine with this defconfig:
> 
>     BR2_arm=y
>     BR2_cortex_a7=y
>     BR2_TOOLCHAIN_EXTERNAL=y
>     BR2_PACKAGE_GSTREAMER1=y
>     BR2_PACKAGE_GST1_IMX=y
>     BR2_PACKAGE_JACK2=y
>     BR2_PACKAGE_MPV=y
>     BR2_PACKAGE_GLMARK2=y
>     BR2_PACKAGE_MESA3D=y
>     BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4=y
>     BR2_PACKAGE_MESA3D_OPENGL_EGL=y
>     BR2_PACKAGE_MESA3D_OPENGL_ES=y
>     BR2_PACKAGE_FREESCALE_IMX=y
>     BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q=y
>     BR2_PACKAGE_LIBIMXVPUAPI=y
>     BR2_PACKAGE_NORM=y
> 
> Except for these platitudes, nothing interesting to state about this new
> infra; it is pretty straightforward...
> 
> Thanks to Romain for early review. ;-)

I'll add a new package (aubio) which use waf as build system and I asked on IRC
if it's time for adding the waf-infra. So here it is, thanks Yann :)

Best regards,
Romain

> 
> 
> Regards,
> Yann E. MORIN.
> 
> 
