From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 9 Apr 2010 00:42:17 +0200
Subject: [Buildroot] [git commit master] CHANGES: add libaio
Message-ID: <20100408224302.672BD8DD10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6cbdb507c37124d06bdac6a82c81aa5c16e164f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   17 +++++++++--------
 1 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/CHANGES b/CHANGES
index e7323a8..f48d8d9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -12,14 +12,15 @@
 	New packages: librsync, libusb-compat, lmbench, netperf, squid
 
 	Updated/fixed packages: busybox, dnsmasq, dosfstools,
-	e2fsprogs, fbv, freetype, iperf, iptables, iw, less, libdrm,
-	libgcrypt, libglib2, libpng, libxml2, matchbox, mdadm,
-	memstat, mesa3d, mtd-utils, nano, openssl, php, pixman, pppd,
-	pthread-stubs, qt, radvd, setserial, squashfs, usb_modeswith,
-	wget, xdriver_xf86-video-intel, xkeyboard-config, xlib_libX11,
-	xlib_libXfont, xlib_libXfontcache, xlib_libXxf86misc,
-	xlib_libpciaccess, xproto_dri2proto, xproto_eviext,
-	xproto_fontcacheproto, xproto_xf86miscproto
+	e2fsprogs, fbv, freetype, iperf, iptables, iw, less,
+	libaio,libdrm, libgcrypt, libglib2, libpng, libxml2, matchbox,
+	mdadm, memstat, mesa3d, mtd-utils, nano, openssl, php, pixman,
+	pppd, pthread-stubs, qt, radvd, setserial, squashfs,
+	usb_modeswith, wget, xdriver_xf86-video-intel,
+	xkeyboard-config, xlib_libX11, xlib_libXfont,
+	xlib_libXfontcache, xlib_libXxf86misc, xlib_libpciaccess,
+	xproto_dri2proto, xproto_eviext, xproto_fontcacheproto,
+	xproto_xf86miscproto
 
 	Issues resolved (http://bugs.uclibc.org):
 
-- 
1.6.3.3
