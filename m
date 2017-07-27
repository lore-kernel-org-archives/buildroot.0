From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Jul 2017 08:16:52 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] Update for 2017.05.2
Message-ID: <20170727061311.95E7281F00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=84eee43369a1afae6905f4a8f2c2b0afc23098f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 23 +++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 4b870a9..407a9dd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,26 @@
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
diff --git a/Makefile b/Makefile
index 61e5c85..ec77517 100644
--- a/Makefile
+++ b/Makefile
@@ -86,9 +86,9 @@ else # umask / $(CURDIR) / $(O)
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2017.05.1
+export BR2_VERSION := 2017.05.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1499203000
+BR2_VERSION_EPOCH = 1501136000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
