From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 06 Oct 2019 10:17:29 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5webview: new package
References: <20190729103339.5383-1-b.bilas@grinn-global.com>
Message-ID: <phko6gx73p.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 29 Jul 2019 12:33:39 +0200 schrieb Bartosz Bilas:

> Signed-off-by: Bartosz Bilas
> <b.bilas@grinn-global.com>

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[build-tested using this defconfig:
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_BINUTILS_VERSION_2_32_X=y
BR2_GCC_VERSION_9_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5WEBENGINE=y
BR2_PACKAGE_QT5WEBVIEW=y
BR2_PACKAGE_XORG7=y]

The package as-is looks fine but to get it compiled I needed these 
patches:

http://patchwork.ozlabs.org/patch/1172361/
http://patchwork.ozlabs.org/project/buildroot/list/?series=133536

Regards, Bernd
