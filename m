From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Feb 2011 23:37:36 +0100
Subject: [Buildroot] [git commit master 1/1] CHANGES: update with recent
	changes
Message-ID: <20110223224019.E21198F626@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2b41d7f4939b98cba5fbddda6fb7e7bba4ca8fd1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   29 +++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 5c866e8..925ef5d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,32 @@
+2011.02, Not yet released:
+
+	Fixes all over the tree.
+
+	Festival packages marked as broken. Unless someone steps up
+	to support them, they will be removed during the 2011.05
+	development cycle.
+
+	Updated/fixed packages: atk, avahi, bind, cairo, dbus,
+	enchant, fakeroot, gmpc, gpsd, gvfs, iperf, jpeg, libarchive,
+	libcgicc, libdaemon, libdrm, libevent, libgail, libglib2,
+	libgpg-error, libmicrohttpd, librsvg, libsoup, libxcp,
+	matchbox-fakekey, matchbox-startup-monitor, mdadm, metacity,
+	mpd, nasm, nfs-utils, olsr, popt, pthread-stubs, quagga, rpm,
+	samba, sdl, sdl_gfx, sdl_image, sdl_mixer, sdl_sound, sdl_ttf,
+	squashfs, taglib, tcpreplay, tiff, wpa_supplicant, xcb-util,
+	xdriver_xf86-input-{acepad,aiptek,evdev,joystick,keyboard},
+	xdriver_xf86-input-{mouse,synaptics,void},
+	xdriver_xf86-video-{chips,dummy,geode,glide,intel,nv,wsfb},
+	xlib_lib{ICE,SM,XScrnSaver,Xau,Xcursor,Xdmcp,Xi,Xinerama},
+	xlib_lib{Xrandr,Xt,Xtst,Xxf86dga,Xxf86vm,dmx,fontenc,pciaccess},
+	xserver_xorg-server, xz
+
+	Removed packages: ace_of_penguins, vlc
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#3283: See why nfs-utils needs fakeroot, and convert to autotools
+
 2011.02-rc1, Released February 14th, 2011:
 
 	Fixes all over the tree and new features.
-- 
1.7.3.4
