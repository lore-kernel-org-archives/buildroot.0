From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Oct 2018 11:32:23 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] Update for 2018.08.1
Message-ID: <20181007093132.E51138DF70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5cb24d72b2835defb03b0448ac51c5ee1d9ee3b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 23 +++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index a505d7ec69..aa5c2ad047 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,26 @@
+2018.08.1, Released October 7th, 2018
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
+	arp-scan, bandwidthd, bind, brltty, clamav, connman, cppcms,
+	domoticz, dtc, fio, gcc, gdb, ghostscript, gnupg, httpping,
+	igmpproxy, imlib2, ipsec-tools, libesmtp, libnfs, libxslt,
+	links, lua, mosquitto, nilfs-utils, ocrad, parted, php,
+	python-django, screen, shairport-sync, strongswan,
+	vboot-utils, webkitgtk, wireguard, x265 xen, xlib_libXdmcp,
+	xlib_libXfont, xlib_libXft, xlib_libxshmfence,
+	xutil_makedepend, zeromq
+
 2018.08, Released September 6th, 2018
 
 	Minor fixes.
diff --git a/Makefile b/Makefile
index f7636e669d..31569472a7 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.08
+export BR2_VERSION := 2018.08.1
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1536263000
+BR2_VERSION_EPOCH = 1538904000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
