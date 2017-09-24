From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Sep 2017 11:16:22 +0200
Subject: [Buildroot] [PATCH v3 7/7] package/glibc: bump to 2.26
References: <20170923212414.16744-1-romain.naour@gmail.com>
 <20170923212414.16744-8-romain.naour@gmail.com>
Message-ID: <6o9k9excmh.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 23 Sep 2017 23:24:06 +0200 schrieb Romain Naour:

> -GLIBC_VERSION = 2.25
> +GLIBC_VERSION = 2.26

Hi,

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Build-tested using these defconfigs:

BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PY_ONLY=y

BR2_powerpc64le=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PY_ONLY=y
