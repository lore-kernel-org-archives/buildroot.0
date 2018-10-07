From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Oct 2018 09:19:35 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] Update for 2018.02.6
Message-ID: <20181007071842.B860C8DF43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67d61cbef5ff190b803745b332d0f7d7177210fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 26 ++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 0c50243c60..cdf682164f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,29 @@
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
diff --git a/Makefile b/Makefile
index dc26099fd4..36614a8c35 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.02.5
+export BR2_VERSION := 2018.02.6
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1535550000
+BR2_VERSION_EPOCH = 1538896000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
