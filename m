From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jul 2017 23:31:50 +0200
Subject: [Buildroot] [git commit] Update for 2017.05.1
Message-ID: <20170704212905.8F7C780E52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d9bcd5facc6c54c00d8fbcd114a9ea567f67c461
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f3d8beeb369412a69adc75bf78391fb8a07d49b5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/CHANGES b/CHANGES
index e7f9b75..b284287 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,34 @@
+2017.05.1, Released July 4th, 2017
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
+	Defconfigs: at91sam9x5ek_mmc: workaround boot rom issue.
+
+	Updated/fixed packages: apache, automake, bind, botan, c-ares,
+	dhcp, expat, fcgiwrap, gcc, gdb, gesftpserver, glibc, glmark2,
+	gnutls, gst1-plugins-bad, imagemagick, imx-uuc, intltool,
+	iperf, ipsec-tools, irssi, kmod, libcurl, libgcrypt, libmad,
+	libnl, lugaro, mosquitto, mpg123, ncurses, nodejs, ntp,
+	openssh, openvpn, pngquant, python-simplegeneric, qt5base,
+	qt5multimedia, rtl8821au, socat, spice, systemd, tor, trinity,
+	tslib, vlc, x264, xen, xlib_libxshmfenc, xserver_xorg-server
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#9976: License file for package 'rtl8821au' incorrect
+
 2017.05, Released May 31st, 2017
 
 	Minor fixes.
