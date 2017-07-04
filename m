From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 19:31:47 +0200
Subject: [Buildroot] [git commit] Update for 2017.02.4
Message-ID: <20170704172923.06E1181932@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=018b8aa7d106a899f60b503263a67fe240b56ddc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7ea1487c0afbbb44eca7b2f9e8759305195ab2a6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/CHANGES b/CHANGES
index cf4b22b..e7f9b75 100644
--- a/CHANGES
+++ b/CHANGES
@@ -204,6 +204,34 @@
 	#9846: musl libc not installed correctly in target folder
 	#9856: build libubox failed on ubuntu 17.04 64bit
 
+2017.02.4, Released July 4th, 2017
+
+	Important / security related fixes.
+
+	Update support/scripts/scancpan to use METACPAN v1 API as v0
+	has been shutdown.
+
+	Update support/scripts/mkusers to handle setups where
+	/etc/shadow is a symlink.
+
+	External toolchain: Don't create musl dynamic loader symlink
+	for static builds.
+
+	Setlocalversion: Correct detection of mercurial revisions for
+	non-tagged versions.
+
+	Updated/fixed packages: apache, automake, bind, botan, c-ares,
+	dhcp, expat, fcgiwrap, gcc, gdb, gesftpserver, glibc, gnutls,
+	gst1-plugins-bad, imagemagick, imx-uuc, intltool, iperf,
+	ipsec-tools, irssi, libgcrypt, libmad, libnl, mosquitto,
+	mpg123, ncurses, nodejs, ntp, openssh, openvpn, qt5base,
+	qt5multimedia, rtl8821au, socat, spice, systemd, tor, tslib,
+	vlc, x264, xserver_xorg-server
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#9976: License file for package 'rtl8821au' incorrect
+
 2017.02.3, Released June 2nd, 2017
 
 	Important / security related fixes.
