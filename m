From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Oct 2014 22:21:00 +0100
Subject: [Buildroot] [PATCH 0/15 v6] Introduce libudev (branch
	yem/libudev2)
In-Reply-To: <XnsA3D3E6DF040E0berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <cover.1414442699.git.yann.morin.1998@free.fr>
 <XnsA3D3E6DF040E0berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <545008BC.90706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/10/14 22:41, Bernd Kuhls wrote:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
> news:cover.1414442699.git.yann.morin.1998 at free.fr:
> 
>> A lot of packages that have a dependency on udev, in fact only require a
>> libudev, not a udev daemon. That's the case for e.g. libinput, libcec,
>> mesa3d...
> 
> Hi,
> 
> building this defconfig worked:

 With "worked", you do mean that it works at runtime, right? Because the problem
with this change is to be sure that the packages still function correctly when
the udev daemon is not running.

 Regards,
 Arnout

> 
> BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
> BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> BR2_GCC_VERSION_4_9_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_XBMC=y
> BR2_PACKAGE_XBMC_ALSA_LIB=y
> BR2_PACKAGE_XBMC_LIBBLURAY=y
> BR2_PACKAGE_XBMC_GOOM=y
> BR2_PACKAGE_XBMC_RSXS=y
> BR2_PACKAGE_XBMC_LIBCEC=y
> BR2_PACKAGE_XBMC_LIBMICROHTTPD=y
> BR2_PACKAGE_XBMC_RTMPDUMP=y
> BR2_PACKAGE_XBMC_LIBSHAIRPLAY=y
> BR2_PACKAGE_XBMC_LIBSMBCLIENT=y
> BR2_PACKAGE_XBMC_LIBTHEORA=y
> BR2_PACKAGE_XBMC_LIBUSB=y
> BR2_PACKAGE_XBMC_LIBVA=y
> BR2_PACKAGE_XBMC_WAVPACK=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_EUDEV=y
> 
> Regards, Bernd
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
