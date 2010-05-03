From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 May 2010 16:07:20 +0200
Subject: [Buildroot] [git commit master] CHANGES: update list of new/updated
	packages
Message-ID: <20100503140805.CE2238D6CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5724e099ea5540498b4206a73e8dd8031f019c66
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mainly package changes done by Thomas' pull requests.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   29 +++++++++++++++++------------
 1 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4aba557..f8e42b4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,18 +9,23 @@
 
 	X.org updated to 7.5.
 
-	New packages: librsync, libatomic_ops, libusb-compat, lmbench,
-	netperf, squid
-
-	Updated/fixed packages: alsa-utils, busybox, bzip2, directfb, dnsmasq,
-	dosfstools, e2fsprogs, eeprog, fbv, freetype, haserl, hostapd,
-	iperf, iptables, iw, less, libaio, libdrm, libgcrypt, libglib2,
-	libpng, libxml2, libxslt, linux-fusion, lua, matchbox, mdadm,
-	memstat, mesa3d, mtd-utils, nano, ncurses, openssl, pciutils,
-	php, pixman, portage, pppd, pthread-stubs, python, qt,
-	radvd, samba, setserial, squashfs, tslib, usb_modeswith, wget,
-	xdata_xcursor-themes, xdriver_xf86-video-intel, xkeyboard-config,
-	xlib_libX11, xlib_libXaw, xlib_libXfont, xlib_libXfontcache,
+	New packages: cdrkit, cramfs, genext2fs, genromfs,
+	libatomic_ops, librsync, libusb-compat, lmbench, netperf,
+	squashfs, squashfs3, squid
+
+	Updated/fixed packages: alsa-utils, argus, autoconf, bison,
+	busybox, bzip2, directfb, dnsmasq, dosfstools, e2fsprogs,
+	eeprog, fakeroot, fbv, findutils, freetype, haserl, hostapd,
+	iperf, iptables, iw, less, libaio, libcgi, libcgicc, libdrm,
+	libgcrypt, libglib2, libid3tag, libmad, liboil, libosip2,
+	libpng, libraw1394, libsysfs, libxml2, libxslt, linux-fusion,
+	ltrace, lua, lzma, madplay, makedevs, matchbox, mdadm,
+	memstat, mesa3d, mtd-utils, nano, ncurses, openssl, patch,
+	pciutils, php, pixman, portage, pppd, pthread-stubs, python,
+	qt, radvd, samba, setserial, smartmontools, tar, tslib,
+	udpcast, usb_modeswith, vtun, wget, xdata_xcursor-themes,
+	xdriver_xf86-video-intel, xkeyboard-config, xlib_libX11,
+	xlib_libXaw, xlib_libXfont, xlib_libXfontcache,
 	xlib_libXxf86misc, xlib_libXtst, xlib_libpciaccess,
 	xproto_dri2proto, xproto_eviext, xproto_fontcacheproto,
 	xproto_xf86miscproto, xserver_xorg-server
-- 
1.6.3.3
