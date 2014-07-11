From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 11 Jul 2014 22:13:39 +0200
Subject: [Buildroot] [PATCH 16/20 RFC] package/mesa3d: depends on
	libudev, not udev
References: <cover.1402699915.git.yann.morin.1998@free.fr>
 <e623bd3fd72faf81d9f1bace6f97ad7c75dd39ed.1402699915.git.yann.morin.1998@free.fr>
Message-ID: <XnsA367E21B9F924berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
news:e623bd3fd72faf81d9f1bace6f97ad7c75dd39ed.1402699915.git.yann.morin.199
8 at free.fr: 

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Signed-off-by: "Yann E. MORIN"
> <yann.morin.1998@free.fr> Cc: Bernd Kuhls
> <bernd.kuhls@t-online.de> ---

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Compile tested using this defconfig

BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_EUDEV=y

Regards, Bernd
