From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Oct 2018 11:44:17 +0200
Subject: [Buildroot] [git commit] Update for 2018.08.1
Message-ID: <20181007094633.3EEFE8C6DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4f7988012f7d76797bf7e63cf3d499f11018d27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5cb24d72b2835defb03b0448ac51c5ee1d9ee3b0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/CHANGES b/CHANGES
index 8efdd67fe8..3f46831a9e 100644
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
