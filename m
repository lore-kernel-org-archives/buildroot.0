From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Jul 2017 08:41:38 +0200
Subject: [Buildroot] [git commit] Update for 2017.05.2
Message-ID: <20170727063756.1902B81979@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0b7d387e4842102bff3684d7a366da25c55c852
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 84eee43369a1afae6905f4a8f2c2b0afc23098f0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/CHANGES b/CHANGES
index f693c82..ce3ea23 100644
--- a/CHANGES
+++ b/CHANGES
@@ -24,6 +24,29 @@
 	  externally used toolchain. For compatibility with existing
 	  scripts, a link usr -> . is still added.
 
+2017.05.2, Released July 27th, 2017
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
+	busybox, ccache, collectd, dieharder, efibootmgr, efivar,
+	expat, ffmpeg, gcc, heimdal, iproute2, irssi, libglib2,
+	libmemcached, libosip2, libtirpc, libxml-parser-perl,
+	linux-fusion, linux-zigbee, mpg123, orc, pcre, php, protobuf,
+	pulseaudio, python-setproctitle, qt5base, rpi-firmware,
+	samba4, syslinux, systemd, spice, tcpdump, tiff, uboot-tools,
+	webkitgtk, x265, xserver_xorg-server, xvisor
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#10061: gcc5.4 buildroot toolchain for powerpc libsanitizer...
+
 2017.05.1, Released July 4th, 2017
 
 	Important / security related fixes.
