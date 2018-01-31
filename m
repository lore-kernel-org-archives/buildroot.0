From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 21:14:36 +0100
Subject: [Buildroot] [git commit] Update for 2017.02.10
Message-ID: <20180131201721.1B1DA881CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f1e216e3073e1a033403f28978fe92f14aa172a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 91850b34977440182e56c9eeb6d57ce34e5c8adc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/CHANGES b/CHANGES
index 3b5bf005bf..c95fe01e65 100644
--- a/CHANGES
+++ b/CHANGES
@@ -712,6 +712,36 @@
 	#9846: musl libc not installed correctly in target folder
 	#9856: build libubox failed on ubuntu 17.04 64bit
 
+2017.02.10, Released January 31st, 2018
+
+	Important / security related fixes.
+
+	nconfig: Fix for ncurses/ncursesw linking issue causing crashes.
+
+	System: Only show getty options when busybox init or sysvinit
+	are used.
+
+	Infrastructure: Fix build issue for autotools based packages
+	checking for C++ support on toolchains without C++ support and
+	on a distro lacking /lib/cpp (E.G. Arch Linux).
+
+	Updated/fixed packages: avahi, berkeleydb, bind, busybox,
+	ccache, clamav, coreutils, dovecot, eeprog, eudev, fis,
+	intel-microcode, iputils, irssi, kmsxx, libcurl, liberation,
+	libiio, lz4, mariadb, matchbox-lib, mcookie, openocd, php,
+	pound, rpcbind, squid, tar, ti-cgt-pru, transmission,
+	util-linux, webkitgtk, wireshark, xen
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#9996: lz4 package does not install lz4 binaries in target
+	#10176: Rsyslog's S01logging is deleted by Busybox.mk from...
+	#10216: package/x11r7/mcookie/mcookie.c:207: bad size ?
+	#10301: systemd/getty unused options
+	#10331: kmsxx, host installation fails with BR2_SHARED_...
+	#10536: Finding non-relative paths in the ccache
+	#10641: avahi-autoipd not starting when using systemd-tmpfiles
+
 2017.02.9, Released January 1st, 2018
 
 	Important / security related fixes.
