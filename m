From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Jul 2017 08:37:14 +0200
Subject: [Buildroot] [git commit] Update for 2017.02.5
Message-ID: <20170727063755.B061F821E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=386dd28a3e27485111f6ba4ed9cfaed833643d9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a2818c7cfa3b7efef41ed85215db60e23cc0876a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/CHANGES b/CHANGES
index a530e8f..f693c82 100644
--- a/CHANGES
+++ b/CHANGES
@@ -261,6 +261,29 @@
 	#9846: musl libc not installed correctly in target folder
 	#9856: build libubox failed on ubuntu 17.04 64bit
 
+2017.02.5, Released July 27th, 2017
+
+	Important / security related fixes.
+
+	Webkitgtk bumped to the 2.16.x series, fixing a large number
+	of security issues.
+
+	host-aespipe compile fix for Debian/Gentoo/Ubuntu toolchains
+	which default to PIE mode.
+
+	Updated/fixed packages: aespipe, apache, bind, binutils,
+	busybox, ccache, collectd, efibootmgr, efivar, expat, ffmpeg,
+	gcc, heimdal, iproute2, irssi, libglib2, libmemcached,
+	libosip2, libtirpc, libxml-parser-perl, linux-fusion,
+	linux-zigbee, mpg123, nodejs, orc, pcre, php, pulseaudio,
+	python-setproctitle, qt5base, rpi-firmware, samba4, syslinux,
+	systemd, spice, tcpdump, tiff, webkitgtk, x265, xen,
+	xserver_xorg-server, xvisor
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#10061: gcc5.4 buildroot toolchain for powerpc libsanitizer...
+
 2017.02.4, Released July 4th, 2017
 
 	Important / security related fixes.
