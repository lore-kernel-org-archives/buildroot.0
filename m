From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Aug 2014 01:05:42 +0200
Subject: [Buildroot] [PATCH v16 0/3] package/xbmc: Add support for
 OpenGL and libva, add option for Goom
In-Reply-To: <1406914359-31106-1-git-send-email-bernd.kuhls@t-online.de>
References: <1406914359-31106-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140812230542.GF4055@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-08-01 19:32 +0200, Bernd Kuhls spake thusly:
> The series is compiled-tested using
> 
> for Intel platform:
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_XBMC=y
> BR2_PACKAGE_XBMC_LIBBLURAY=y
> BR2_PACKAGE_XBMC_LIBCEC=y
> BR2_PACKAGE_XBMC_LIBMICROHTTPD=y
> BR2_PACKAGE_XBMC_LIBNFS=y
> BR2_PACKAGE_XBMC_RTMPDUMP=y
> BR2_PACKAGE_XBMC_LIBSHAIRPLAY=y
> BR2_PACKAGE_XBMC_LIBSMBCLIENT=y
> BR2_PACKAGE_XBMC_LIBTHEORA=y
> BR2_PACKAGE_XBMC_LIBUSB=y
> BR2_PACKAGE_XBMC_WAVPACK=y
> BR2_PACKAGE_XBMC_GOOM=y
> BR2_PACKAGE_XBMC_ADDON_XVDR=y
> BR2_PACKAGE_XBMC_PVR_ADDONS=y
> BR2_PACKAGE_MESA3D=y
> BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
> BR2_PACKAGE_XORG7=y

Weird. I had to had an Xorg server to be able to use XBMC...

But now I can run XBMC on my i915-based nettbook! Woot! :-)
(I just had to tweak mesa3d to build the i915 DRI driver, will push that
to the list soonish...)

Yeah! :-)

I've lost track of all your XBMC-related series. Is the v16 the last
one? Do we miss anything in Buildroot for XBMC ?

I guess we'll need more stuff for Kodi, but that can come later.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
