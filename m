From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Oct 2018 09:52:12 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] Update for 2018.05.3
Message-ID: <20181006075452.4226F8D493@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=717309783755a883974896ea822675a7bf46da3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 24 ++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 548b49ca7f..aef2f9555d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,27 @@
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
diff --git a/Makefile b/Makefile
index 401bc7e8bc..83c68957c4 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.05.2
+export BR2_VERSION := 2018.05.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1535466000
+BR2_VERSION_EPOCH = 1538812000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
