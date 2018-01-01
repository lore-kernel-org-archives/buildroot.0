From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Jan 2018 12:48:38 +0100
Subject: [Buildroot] [git commit] Update for 2017.02.9
Message-ID: <20180101115229.C76758129F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93a8938d847a9900a868910b640495f9f162855f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8f03647169a17b10503594e5f3d95113a01171f9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/CHANGES b/CHANGES
index 5de127d..5f9c3bd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -672,6 +672,21 @@
 	#9846: musl libc not installed correctly in target folder
 	#9856: build libubox failed on ubuntu 17.04 64bit
 
+2017.02.9, Released January 1st, 2018
+
+	Important / security related fixes.
+
+	Fix divide by zero issue in size-stats script.
+
+	Fix makefile include ordering issue with certain make versions
+	in the external toolchain handling.
+
+	Updated/fixed packages: dhcp, exim, flann, gdb, heimdal,
+	libcue, libcurl, libevent, libpqxx, libsoxr, linphone, lldpd,
+	mariadb, mfgtools, mtools, nodejs, nut, openssl, rsync,
+	samba4, tor, vlc, webkitgtk, wireshark, xfsprogs,
+	xlib_libXcursor, xlib_libXfont, xlib_libXfont2
+
 2017.02.8, Released November 27th, 2017
 
 	Important / security related fixes.
