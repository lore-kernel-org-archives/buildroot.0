From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Mar 2012 23:59:32 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20120315225951.B0FCA90DD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=17c2d62b712a0bef22bc02e7c8fdbbfa12b5da4b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   35 +++++++++++++++++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6f58d52..284707c 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,5 +1,40 @@
 2012.05, Not released yet:
 
+	Fixes all over the tree and new features.
+
+	Use /etc/os-release for version info rather than
+	/etc/br-version.
+
+	CMake toolchain file moved to $HOST_DIR/usr/share/buildroot.
+
+	Defconfigs: mx53qsb, use 3.2.x for atngw100,
+
+	Atom processor support.
+
+	Toolchain: Add GCC 4.4.7, 4.6.3. 64bit fixes for external
+	toolchains, linaro ext toolchains, new sourcery codebench ext
+	toolchains.
+
+	Updated/fixed packages: alsa-lib, alsa-utils, atk, avahi,
+	barebox, bluez_utils, can-utils, ccache, dhcp, dnsmasq,
+	e2fsprogs, expat, feh, file, freetype, gamin, gmp, gpsd, grep,
+	gstreamer, gst-plugins-{bad,base,good,ugly}, hdparm,
+	imagemagick, kmod, libarchive, libcurl, libethumb, libffi,
+	libfuse, libglib2, libnl, libsoup, libxml2, libxslt,
+	linux-firmware, lite, lua, microperl, mpd, mpfr, mtd, nbd,
+	network-manager, ntfs-3g, openssl, pixman, qt, radvd, sdl_net,
+	smartmontools, squashfs3, squid, sysstat, tiff, usbutils,
+	util-linux, vala, wipe, xdriver_xf86-video-fbdev, zlib,
+
+	New packages: glib-networking, lcdprog, minicom, parted,
+	zeromq
+
+	Removed packages: ntfsprogs
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#4880: New package lcdproc
+
 2012.02, Released February 29th, 2012:
 
 	Updated/fixed packages: libecore
