From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 25 Jun 2010 12:31:51 +0200
Subject: [Buildroot] [git commit master 1/1] CHANGES: update after
	autotools-conversion merge
Message-ID: <20100625103243.CE6EC81DB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=88d451c8db4f7d6cfa72f21dceabf8e10fb5b825
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/CHANGES b/CHANGES
index fc1a7fb..585a700 100644
--- a/CHANGES
+++ b/CHANGES
@@ -11,15 +11,17 @@
 	New GTK-based configurator, usable using 'make gconfig'.
 
 	New packages: cgilua, copas, coxpcall, ffmpeg, luafilesystem,
-	luasocket, rings, wsapi, xavante
+	luasocket, rings, wsapi, xavante, xterm
 
-	Updated/fixed packages: busybox, cdrkit, file, gawk,
-	gstreamer, intltool, ipsec-tools, iptables, libart, libidn,
-	lmbench, lrzsz, ncurses, module-init-tools, nbd, netperf,
-	ntfsprogs, openssl, php, qt, sqlite, squashfs, tn5250,
-	usbutils, xkeyboard-config
+	Updated/fixed packages: berkeleydb, busybox, cdrkit, dash,
+	dialog, diffutils, distcc, dmalloc, fbv, file, gawk,
+	gstreamer, gzip, intltool, ipsec-tools, iptables, libart,
+	libfuse, libgpg-error, libidn, liblockfile, links, lmbench,
+	lrzsz, make, module-init-tools, nbd, ncurses, netperf,
+	ntfsprogs, openssl, php, qt, quagga, sqlite, sdl, sdl_mixer,
+	sdl_ttf, squashfs, tn5250, usbutils, xkeyboard-config
 
-	Removed packages: modutils
+	Removed packages: modutils, rxvt
 
 	Issues resolved (http://bugs.uclibc.org):
 
-- 
1.7.1
