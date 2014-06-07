From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Jun 2014 14:39:36 +0200
Subject: [Buildroot] [PATCH v12 00/32] xbmc: bump version to 13.1
In-Reply-To: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
References: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140607123936.GA3492@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-06-07 14:31 +0200, Bernd Kuhls spake thusly:
> the patch series combines my latest patches to bump xbmc.
[--SNIP--]
> Bernd Kuhls (28):
>   xbmc: add host-gettext dependency
>   xbmc: add host-nasm dependency
>   xbmc: add host-yasm dependency for MMX/64bit archs
>   xbmc: add missing egl-related cflags
>   xbmc: hdmi cec supports needs udev for device scanning
>   xbmc: bump version to 13.1
>   xbmc-pvr-addons: bump to a version compatible with XBMC Gotham
>   xbmc-addon-xvdr: bump to a version compatible with XBMC Gotham
>   mesa3d: Bump version to 10.2.1, fix xa build
>   mesa3d: Depend on xorg meta package instead of xserver_xorg-server
>   mesa3d: add dependency xproto_presentproto
>   mesa3d: Remove dependency for the libxml2 module of host-python
>   mesa3d: Add dri3 support
>   mesa3d: dri2 does not need udev support
>   libva: new package
>   libva-intel-driver: new package
>   ffmpeg: Add libva support
>   libglu: new package
>   libglew: new package
>   sdl: Add new dependency libglu for opengl support
>   xdriver_xf86-video-intel: Bump version to 2.99.911
>   xbmc: Allow compilation with uClibc
>   xbmc: Add alsa support
>   xbmc: Add lame support
>   xbmc: Fix TexturePacker compile
>   xbmc: Add X.org/OpenGL support
>   xbmc: Add option for Goom screensaver
>   xbmc: Add VA-API support
> 
> Samuel Martin (2):
>   xbmc: fix missing libraries from rpi-userland
>   rpi-userland: cleanup *_CONF_OPT
> 
> Yann E. MORIN (2):
>   toolchain: add option to copy the gconv libraries
>   package/libcec: fix missing libraries from rpi-userland

The last three patches in the series should not be part of the series,
and should be applied first; besides there's a mising one. They are part
of another series by Samuel:
    http://lists.busybox.net/pipermail/buildroot/2014-June/098496.html
    http://patchwork.ozlabs.org/patch/356127/
    http://patchwork.ozlabs.org/patch/356128/
    http://patchwork.ozlabs.org/patch/356129/
    http://patchwork.ozlabs.org/patch/356130/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
