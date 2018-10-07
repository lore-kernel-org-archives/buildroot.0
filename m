From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Oct 2018 09:54:57 +0200
Subject: [Buildroot] [git commit] Update for 2018.02.6
Message-ID: <20181007075634.4DF677FD90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efdb7771a823aaedcf6992db7a0ceaafb0ca9e8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 67d61cbef5ff190b803745b332d0f7d7177210fc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/CHANGES b/CHANGES
index 41f4ff6de1..8efdd67fe8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -437,6 +437,32 @@
 	#10961: Grub2 fails to build for x86_64 when BR2_SSP_ALL is
 		enabled
 
+2018.02.6, Released October 7th, 2018
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
+	Updated/fixes packages: acpid, android-tools, apache,
+	arp-scan, bandwidthd, bind, bison, clamav, connman, cppcms,
+	cramfs, fio, gcc, ghostscript, glibc, gnupg, httping,
+	igmpproxy, imagemagick, imlib2, ipsec-tools, lcms2, libcurl,
+	libesmtp, libnfs, libssh, libxslt, links, linuxptp,
+	mediastreamer, minicom, moarvm, nilfs-utils, ocrad, parted,
+	php, pv, python-django, qt, qt5quickcontrols, qt5webengine,
+	screen, sdl2, shairport-sync, squashfs, strongswan,
+	vboot-utils, webkitgtk, wireguard, x265, xen, xlib_libXfont,
+	xlib_libXft
+
+	New packages: brotli, woff2
+
 2018.02.5, Released August 29th, 2018
 
 	Important / security related fixes.
