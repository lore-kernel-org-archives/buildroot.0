From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 2 Aug 2009 23:09:07 +0200
Subject: [Buildroot] [git commit] CHANGES: update for 2009.08-rc1
Message-ID: <20090802211635.9C0BE777BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3190d5bf0634420a1ab82d1e4487b4c6c1d02aa5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   24 +++++++++++++++++++++++-
 1 files changed, 23 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 096f4b2..0c1f667 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,6 @@
-2009.08, Not yet released:
+2009.08-rc1, Released August 2nd, 2009:
+
+	Fixes all over the tree and new features.
 
 	Improvement of external toolchain support:
 	  - Support for glibc toolchains.
@@ -12,6 +14,26 @@
 
 	New QT-based configurator, usable using 'make xconfig'.
 
+	Support for the Xtensa architecture.
+
+	Toolchain: GCC 4.4.1, 2.6.30 kernel headers, removed < 2.6.26
+	headers.
+
+	New packages: bmon, ctorrent, dosfstools, enchant,
+	gst-plugins-bad, iw, libmms, libnl, netstat-nat, ntfsprogs,
+	sdl_gfx, spawn-fcgi.
+
+	Updated packages: bind, busybox, coreutils, sqlite, directfb,
+	expat, gamin, gnuconfig, haserl, ipsec-tools, classpath,
+	libcurl, libglib2, liblockfile, libpng, libsoup, libxml2,
+	lighttpd, ltp-testsuite, lvm2, matchbox, memstat,
+	gst-plugins-good, gstreamer, libogg, libvorbis, mplayer,
+	neon, openssl, pciutils, php, qt, ruby, sawman, webkit,
+	wpa-supplicant, xdriver_xf86-input-synaptics,
+	xdriver_xf86-video-intel, xlib_libXfont, xlib_libXft,
+	xlib_libXt, xproto_xproto, xserver-xorg, xutil_makedepend,
+	xutil_util-macros.
+
 	Issues resolved (http://bugs.uclibc.org):
 
 	#83: liblockfile fails to compile due to eaccess redefinition
-- 
1.6.3.3
