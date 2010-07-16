From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Jul 2010 00:02:13 +0200
Subject: [Buildroot] [git commit master 1/1] CHANGES: #2191 is resolved
Message-ID: <20100716220328.9A48982B55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1eb59f598f52b65b3d3adfcf74729091e95015f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixed by the linux-fusion-fix branch.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index e1f8a0e..d0a827b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -19,10 +19,11 @@
 	dmalloc, dnsmasq, dropbear, e2fsprogs, fbv, file, fontconfig,
 	gawk, gstreamer, gzip, intltool, ipsec-tools, iptables,
 	libart, libcgi, libfuse, libgpg-error, libidn, liblockfile,
-	libpng, links, lmbench, lrzsz, make, module-init-tools, nbd,
-	ncurses, netperf, ntfsprogs, openssl, php, qt, quagga, sqlite,
-	sdl, sdl_mixer, sdl_sound, sdl_ttf, squashfs, tn5250, tremor,
-	usbutils, xkeyboard-config, xserver_xorg-server, xvkbd
+	libpng, links, linux-fusion, lmbench, lrzsz, make,
+	module-init-tools, nbd, ncurses, netperf, ntfsprogs, openssl,
+	php, qt, quagga, sqlite, sdl, sdl_mixer, sdl_sound, sdl_ttf,
+	squashfs, tn5250, tremor, usbutils, xkeyboard-config,
+	xserver_xorg-server, xvkbd
 
 	Removed packages: modutils, portage, rxvt
 
@@ -59,6 +60,7 @@
 	#2155: Compression lzo don't set for ubifs
 	#2166: [SECURITY] Update libpng to 1.2.44
 	#2167: Bump busybox to 1.17.0, convert to gentargets, drop 1.12, ...
+	#2191: linux-fusion build fail
 	#2221: Qt does not compile (dependencies not taken into account?)
 
 2010.05, Released May 30th, 2010:
-- 
1.7.1
