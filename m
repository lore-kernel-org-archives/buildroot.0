From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 19 Sep 2017 09:50:24 +0200
Subject: [Buildroot] [PATCH v2 10/11] package/glibc: bump to 2.26
References: <20170902205423.21288-1-romain.naour@gmail.com>
 <20170902205423.21288-11-romain.naour@gmail.com>
Message-ID: <0ru69ex7qp.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 02 Sep 2017 22:54:22 +0200 schrieb Romain Naour:

> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -4,7 +4,7 @@
>  #
>  
################################################################################
>  
> -GLIBC_VERSION = 2.25
> +GLIBC_VERSION = 2.26
>  GLIBC_SITE = $(BR2_GNU_MIRROR)/libc
>  GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.xz
>  GLIBC_SRC_SUBDIR = .

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[build-tested using this defconfig:
BR2_x86_64=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PY_ONLY=y]
