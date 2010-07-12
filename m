From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Jul 2010 13:32:38 +0200
Subject: [Buildroot] [git commit master 1/1] libpng: bump to 1.2.44
	[CVE-2010-1205]
Message-ID: <20100712113642.917D282905@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a7c24b6395076d898fc1903e88c4648320a52d47
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2166

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    7 ++++---
 package/libpng/libpng.mk |    2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2c54877..ae6bd9a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -19,9 +19,9 @@
 	dmalloc, dnsmasq, dropbear, e2fsprogs, fbv, file, fontconfig,
 	gawk, gstreamer, gzip, intltool, ipsec-tools, iptables,
 	libart, libcgi, libfuse, libgpg-error, libidn, liblockfile,
-	links, lmbench, lrzsz, make, module-init-tools, nbd, ncurses,
-	netperf, ntfsprogs, openssl, php, qt, quagga, sqlite, sdl,
-	sdl_mixer, sdl_sound, sdl_ttf, squashfs, tn5250, tremor,
+	libpng, links, lmbench, lrzsz, make, module-init-tools, nbd,
+	ncurses, netperf, ntfsprogs, openssl, php, qt, quagga, sqlite,
+	sdl, sdl_mixer, sdl_sound, sdl_ttf, squashfs, tn5250, tremor,
 	usbutils, xkeyboard-config, xserver_xorg-server, xvkbd
 
 	Removed packages: modutils, portage, rxvt
@@ -57,6 +57,7 @@
 	#2119: Tries to build kernel, although disabled in config
 	#2143: buildroot compiler generates segfaulting statically linked exe..
 	#2155: Compression lzo don't set for ubifs
+	#2166: [SECURITY] Update libpng to 1.2.44
 
 2010.05, Released May 30th, 2010:
 
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index f458871..a81d951 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -3,7 +3,7 @@
 # libpng (Portable Network Graphic library)
 #
 #############################################################
-LIBPNG_VERSION:=1.2.43
+LIBPNG_VERSION:=1.2.44
 LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
 LIBPNG_LIBTOOL_PATCH = NO
-- 
1.7.1
