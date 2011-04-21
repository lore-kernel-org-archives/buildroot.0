From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 21 Apr 2011 23:52:45 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20110421215407.6F6C38294B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3510193460d7eb9eca2b944212ee84cabe4996a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/CHANGES b/CHANGES
index d0a61eb..5d29693 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,11 +3,13 @@
 	Updated/fixed packages: alsa-lib, alsa-utils, alsamixergui,
 	avahi, busybox, copas, dnsmasq, dropbear, ethtool, fakeroot,
 	ffmpeg, file, gnuconfig, gst-ffmpeg, gst-plugins-good, icu,
-	imagemagick, libdnet, libpng, libxml2, libxslt, lighttpd,
-	makedevs, midori, mpg123, mpd, mtd-utils, ncurses, netsnmp,
-	openssl, pkg-config, qt, quagga, readline, rsync, samba,
-	socat, squashfs, webkit, xerces, xlib_xtrans, xorg-server,
-	xterm, xz
+	imagemagick, iproute2, less, libdnet, libpng, libxml2,
+	libxslt, lighttpd, makedevs, midori, mpg123, mpd, mtd-utils,
+	ncurses, netsnmp, openssl, pkg-config, procps, qt, quagga,
+	readline, rsync, samba, squid, socat, squashfs, tslib, webkit,
+	xerces, xlib_xtrans, xorg-server, xterm, xz
+
+	New packages: can-utils, htop, libv4l
 
 	Issues resolved (http://bugs.uclibc.org):
 
-- 
1.7.3.4
