From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Oct 2018 18:02:26 +0200
Subject: [Buildroot] [git commit] Update for 2018.05.3
Message-ID: <20181007064022.8E6B38DF39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b5694bbde038392f32e1b6776f6d9e38f0b010f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop Makefile changes]
(cherry picked from commit 717309783755a883974896ea822675a7bf46da3a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/CHANGES b/CHANGES
index a505d7ec69..41f4ff6de1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -159,6 +159,30 @@
 	#11121: statfs call corrupts memory struct statfs  too small
 	#11181: Switching toolchain does not work
 
+2018.05.3, Released October 6th, 2018
+
+	Important / security related fixes.
+
+	Add a number of patches to fix build errors for host utilities
+	on modern distributions using glibc-2.28.
+
+	mkusers: Ensure existing group members are preserved when a
+	group is reprocessed.
+
+	printvars: Fix issue with exceeding shell command line length
+	limits for certain setups.
+
+	Updated/fixed packages: acpid, android-tools, apache,
+	arp-scan, bandwidthd, bind, bison, brltty, chipmunk, connman,
+	cppcms, fio, gcc, ghostscript, gnupg, httping, igmpproxy,
+	imagemagick, imlib2, ipsec-tools, lcm2, libcurl, libesmtp,
+	libnfs, libssh, libxslt, links, mediastreamer, minicom,
+	moarvm, nilfs-utils, ocrad, parted, php, postgresql, pv,
+	python-django, qt, qt5quickcontrols, qt5webengine, screen,
+	sdl2, shairport-sync, squashfs, strongswan, vboot-utils,
+	webkitgtk, wireguard, x265, xen, xlib_libXfont, xlib_libXft,
+	xlib_libxshmfence, zeromq
+
 2018.05.2, Released August 28th, 2018
 
 	Important / security related fixes.
