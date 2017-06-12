From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Jun 2017 10:11:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: fix musl build error
In-Reply-To: <20170611190637.27379-1-bernd.kuhls@t-online.de>
References: <20170611190637.27379-1-bernd.kuhls@t-online.de>
Message-ID: <20170612101114.1f41af24@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Jun 2017 21:06:37 +0200, Bernd Kuhls wrote:
> To reproduce the build error use this defconfig:
> 
> BR2_x86_64=y
> BR2_x86_atom=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-musl-2017.02-744-g40962a0.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
> BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_I915=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON=y
> BR2_PACKAGE_MESA3D_OSMESA=y
> BR2_PACKAGE_MESA3D_OPENGL_ES=y
> BR2_PACKAGE_MESA3D_OPENGL_TEXTURE_FLOAT=y
> BR2_PACKAGE_XORG7=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/0007-musl.patch | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/mesa3d/0007-musl.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
