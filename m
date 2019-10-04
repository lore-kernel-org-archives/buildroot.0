From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 04 Oct 2019 18:56:41 +0200
Subject: [Buildroot] [PATCH v5 2/3] package/wayland-protocols: bump to
 version 1.18
References: <20191004144618.37845-1-james.hilliard1@gmail.com>
 <20191004144618.37845-2-james.hilliard1@gmail.com>
Message-ID: <97ak6gxhu8.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 04 Oct 2019 08:46:17 -0600 schrieb James Hilliard:

> Signed-off-by: James Hilliard
> <james.hilliard1@gmail.com>

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[build-tested using this defconfig:
BR2_x86_64=y
BR2_x86_core2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/
tarballs/br-x86-64-core2-full-2019.05.1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_WESTON=y
BR2_PACKAGE_WESTON_DEFAULT_BACKEND_DRM=y
BR2_PACKAGE_WESTON_DRM=y
BR2_PACKAGE_WESTON_FBDEV=y
BR2_PACKAGE_WESTON_RDP=y
BR2_PACKAGE_WESTON_X11=y
BR2_PACKAGE_WESTON_XWAYLAND=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_LIBEPOXY=y]
