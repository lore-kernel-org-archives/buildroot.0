From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Jul 2018 23:20:05 +0200
Subject: [Buildroot] [PATCH v4 00/18] package/x11r7/xserver_xorg-server:
 bump version to 1.20.0
In-Reply-To: <20180721141648.29939-1-bernd.kuhls@t-online.de>
References: <20180721141648.29939-1-bernd.kuhls@t-online.de>
Message-ID: <20180728232005.035e8a61@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Sat, 21 Jul 2018 16:16:30 +0200, Bernd Kuhls wrote:

> Bernd Kuhls (18):
>   package/x11r7/xorgproto: new package
>   package/efl: switch to xorgproto
>   package/gstreamer1/gst1-plugins-base: switch to xorgproto
>   package/libdri2: switch to xorgproto
>   package/libvdpau: switch to xorgproto
>   package/mesa3d: switch to xorgproto
>   package/x11r7/xapp_*: mass switch to xorgproto
>   package/x11r7/xdriver_xf86-input-*: mass switch to xorgproto
>   package/x11r7/xdriver_xf86-video-*: mass switch to xorgproto
>   package/x11r7/xkeyboard-config: switch to xorgproto
>   package/x11r7/xlib_*: mass switch to xorgproto
>   package/x11r7/xutil_makedepend: switch to xorgproto
>   package/x11r7/xserver_xorg-server: switch to xorgproto
>   package/x11r7/xproto_*: mass removal
>   package/x11r7/xdriver_xf86-video-r128: add ustream patch to fix
>     support for xserver_xorg-server 1.20.0
>   package/x11r7/xdriver_xf86-video-savage: add patch to fix support for
>     xserver_xorg-server 1.20.0
>   package/x11r7/xdriver_xf86-video-sis: add upstream patch to fix
>     support for xserver_xorg-server 1.20.0
>   package/x11r7/xserver_xorg-server: bump version to 1.20.0

Thanks a lot for your work on this, much appreciated!

I've applied the whole series. I only did some changes to the
Config.in.legacy part, to fix check-package issues and generally
improve the wording of the legacy options.

We'll see what the autobuilders have to say, but I did a X.org server
1.14 build and a X.org server 1.20 build, and both went fine.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
