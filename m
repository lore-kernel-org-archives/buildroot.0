From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 02 Jun 2014 21:22:12 +0200
Subject: [Buildroot] [PATCH 0/30 v11] xbmc: bump version to 13.1 (branch
	yem/bernd/xbmc-10)
References: <cover.1401274944.git.yann.morin.1998@free.fr>
 <0bru5bx1ii.ln2@ID-313208.user.individual.net>
 <20140602184142.GA3404@free.fr>
Message-ID: <4gvu5bx1ii.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
news:20140602184142.GA3404 at free.fr: 

> Would care also sharing the corresponding defconfig, please?

Hi,

my defconfig looks like this:

BR2_x86_pentium_mmx=y
BR2_OPTIMIZE_2=y
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_BINUTILS_VERSION_2_23_2=y
BR2_GCC_VERSION_4_8_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_STATIC=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y
BR2_PACKAGE_XBMC=y
BR2_PACKAGE_XBMC_LIBBLURAY=y
BR2_PACKAGE_XBMC_LIBMICROHTTPD=y
BR2_PACKAGE_XBMC_LIBNFS=y
BR2_PACKAGE_XBMC_RTMPDUMP=y
BR2_PACKAGE_XBMC_LIBSMBCLIENT=y
BR2_PACKAGE_XBMC_LIBTHEORA=y
BR2_PACKAGE_XBMC_LIBUSB=y
BR2_PACKAGE_XBMC_WAVPACK=y
BR2_PACKAGE_XBMC_GOOM=y
BR2_PACKAGE_XBMC_PVR_ADDONS=y
BR2_PACKAGE_TVHEADEND=y

Please note that this defconfig is only a snippet from the bigger .config 
file provided by the fli4l project. Here I added my xbmc patches to create a 
xbmc binary package for fli4l (yet to be released to the public ;))

Regards, Bernd
