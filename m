From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2016 23:08:34 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20160217220903.BDE28818BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a00646db2d4911e9c449f2a04672532a959c2432
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/CHANGES b/CHANGES
index 6892121..18624a0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,25 @@
+2016.02, Not yet released
+
+	Fixes all over the tree.
+
+	Toolchain: PR19405 backport to binutils 2.25.1 to fix NIOS ld
+	crash. glibc security patches for CVE-2014-8121, CVE-2015-1781
+	and CVE-2015-7547.
+
+	Defconfigs for Acmesystems Arietta g25 added.
+
+	Updated/fixed packages: binutils, boost, chrony, dovecot,
+	e2fsprogs, fio, gdb, glibc, graphite2, icu, kbd, libbsd,
+	libcue, libgcrypt, libraw, links, mc, mosquitto, nodejs,
+	postgresql, pptp-linux, pulseaudio, samba4, spice, squid,
+	sysklogd, systemd, tiff, uclibc, ulogd, util-linux, valgrind.
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#8576: Building embedded Linux for Atmel SAMA5D4_Xplained...
+	#8606: Problem compiling on Arch Linux
+	#8681: kbd 2.0.3 does not build on rpi
+
 2016.02-rc1, Released February 10th, 2016
 
 	Fixes all over the tree and new features.
