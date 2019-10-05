From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 05 Oct 2019 16:18:48 +0200
Subject: [Buildroot] [PATCH v2 3/4] package/mesa3d: add xlib_libXv
 dependency to mesa3d xvmc
References: <20191005094818.1956334-1-romain.naour@gmail.com>
 <20191005094818.1956334-3-romain.naour@gmail.com>
Message-ID: <8blm6gxbel.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 05 Oct 2019 11:48:17 +0200 schrieb Romain Naour:

> Signed-off-by: Romain Naour
> <romain.naour@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[build-tested using this defconfig:
BR2_KERNEL_HEADERS_4_4=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_BINUTILS_VERSION_2_30_X=y
BR2_GCC_VERSION_5_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_INIT_NONE=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_LLVM=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU=y
BR2_PACKAGE_MESA3D_XVMC=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_XORG7=y]
