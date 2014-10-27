From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 27 Oct 2014 22:41:44 +0100
Subject: [Buildroot] [PATCH 0/15 v6] Introduce libudev (branch
	yem/libudev2)
References: <cover.1414442699.git.yann.morin.1998@free.fr>
Message-ID: <XnsA3D3E6DF040E0berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:cover.1414442699.git.yann.morin.1998 at free.fr:

> A lot of packages that have a dependency on udev, in fact only require a
> libudev, not a udev daemon. That's the case for e.g. libinput, libcec,
> mesa3d...

Hi,

building this defconfig worked:

BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_GCC_VERSION_4_9_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_XBMC=y
BR2_PACKAGE_XBMC_ALSA_LIB=y
BR2_PACKAGE_XBMC_LIBBLURAY=y
BR2_PACKAGE_XBMC_GOOM=y
BR2_PACKAGE_XBMC_RSXS=y
BR2_PACKAGE_XBMC_LIBCEC=y
BR2_PACKAGE_XBMC_LIBMICROHTTPD=y
BR2_PACKAGE_XBMC_RTMPDUMP=y
BR2_PACKAGE_XBMC_LIBSHAIRPLAY=y
BR2_PACKAGE_XBMC_LIBSMBCLIENT=y
BR2_PACKAGE_XBMC_LIBTHEORA=y
BR2_PACKAGE_XBMC_LIBUSB=y
BR2_PACKAGE_XBMC_LIBVA=y
BR2_PACKAGE_XBMC_WAVPACK=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_EUDEV=y

Regards, Bernd
