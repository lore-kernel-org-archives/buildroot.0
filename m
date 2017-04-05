From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 5 Apr 2017 23:22:18 +0200
Subject: [Buildroot] [git commit] Update for 2017.02.1
Message-ID: <20170405212236.AEE83825FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a165809533b372a1920873463174bbf7ac201457
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 476067a78d4fd1ddb141a8cccc63cf3e75cbe7a3)
---
 CHANGES | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/CHANGES b/CHANGES
index 64179a2..974f4e2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,42 @@
+2017.02.1, Released April 4th, 2017
+
+	Important / security related fixes.
+
+	Fix a variable clashing issue in the mkusers script with
+	internal bash variables.
+
+	Improve external toolchain version detection.
+
+	Correct permissions for /dev/pts/ptmx when systemd is used
+	with recent glibc versions.
+
+	Fix python module name clash for graph-depends.
+
+	Fakeroot now links against libacl to fix issues on
+	distributions using acls.
+
+	Ensure that the git download infrastructure creates GNU format
+	tar files.
+
+	br2-external: Improve error reporting.
+
+	Updated/fixed packages: acl, apr, audiofile, busybox, cairo,
+	dbus-cpp, dbus-glib, dbus-triggerd, domoticz, elfutils,
+	fakeroot, filemq, fmc, gdb, git, gnutls, gst-ffmpeg,
+	gst1-plygins-bad, harfbuzz, htop, imagemagick, jasper, libcec,
+	libiio, libplatform, librsvg, libselinux, libsidplay2, libsoc,
+	libwebsockets, libxkbcommon, linux-firmware, logrotate,
+	lpt-testsuite, lttng-libust, mariadb, mbedtls, memcached,
+	mesa3d, mpd, mplayer, nbd, ncftp, ntp, openssh, opentyrian,
+	pcre, perl-gd, python, qt5base, rpi-userland, rpm, samba4,
+	skalibs, slang, sngrep, squashfs, syslog-ng, taglib,
+	tcpreplay, tor, upmpdcli, wget, wireshark,
+	xdriver_xf86-video-vmware, xlib_libXv, zmqpp
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#9456: mkusers script bash errors
+
 2017.02, Released February 28th, 2017
 
 	Minor fixes, mainly fixing autobuilder issues.
