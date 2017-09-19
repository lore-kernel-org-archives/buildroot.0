From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 19 Sep 2017 09:54:30 +0200
Subject: [Buildroot] [PATCH v2 03/11] package/mesa3d: fix build issue
 with	glibc >= 2.26
References: <20170902205423.21288-1-romain.naour@gmail.com>
 <20170902205423.21288-4-romain.naour@gmail.com>
Message-ID: <m2v69ex7qp.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain.

Am Sat, 02 Sep 2017 22:54:15 +0200 schrieb Romain Naour:

> Issue found while testing glibc 2.26 bump.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

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

Please send the patch upstream.

Regards, Bernd
