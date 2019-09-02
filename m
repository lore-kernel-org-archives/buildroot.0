From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 22:58:49 +0200
Subject: [Buildroot] [git commit] Update for 2019.02.5
Message-ID: <20190902205853.14BCF88E86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65e48f7afd1b8513f4189398ded5da3c2d88a49a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Peter: drop Makefile changes]
(cherry picked from commit b1408d04a383eacadf1518886d216325304569ae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/CHANGES b/CHANGES
index ee2f259230..5297220285 100644
--- a/CHANGES
+++ b/CHANGES
@@ -301,6 +301,43 @@
 	#11761: Building custom kernel 5.1-rc3 or later breaks on objtool
 	#11816: Only selected coreutils binaries are installed
 
+2019.02.5, Released September 2nd, 2019
+
+	Important / security related fixes.
+
+	Filesystems: Pass extra pax options to tar for binary
+	reproducibility.
+
+	Updated/fixed packages: apache, arm-trusted-firmware,
+	asterisk, atk, autofs, batctl, batman-adv, berkeleydb, brotli,
+	busybox, bzip2, clamav, cloop, cmake, collectd, connman-gtk,
+	cryptopp, dahdi-linux, dahdi-tools, daq, dehydrated, dovecot,
+	dovecot-pigeonhole,, elfutils, evtest, exim, expect, giflib,
+	git, glib-networking, glibc, gnupg2, gnutls, go,
+	gst1-rtsp-server, gtkperf, gupnp-tools, gvfs, imagemagick,
+	imx-uuc, intel-microcode, json-glib, lftp, libbsd, libcurl,
+	libgit2, libgtk3, libmodplug, libnss, libpri, libshout,
+	libss7, libssh2, libvips, libxcb, linux-headers, mdadm,
+	mesa3d, metacity, mpg123, mosquitto, musl, nginx, openblas,
+	opencv3, openldap, openvmtools, pcmanfm, php, pigpio,
+	postgresql, prboom, proftpd, proj, python, python-django,
+	python-idna, python-numpy, python-urllib3, python3, qemu, qt5,
+	qt5base, qt5enginio, quagga, rygel, squid, subversion,
+	tcpreplay, unzip, vlc, vte, webkitgtk, weston, wireless-regdb,
+	xen, xfont_font-util, xlib_libICE, xlib_libXfont,
+	xlib_libXfont2, yad, zeromq
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11741: pigpio does not build host-pigpio
+	#11876: automount using host mount/umount
+	#11881: Build breaks with lftp package enabled and libexpat1-dev inst..
+	#11921: dahdi fails to build
+	#11961: libpri build failure
+	#12096: tcpreplay: build fails if libdumbnet-dev is installed in the..
+	#12106: daq: build fails if libdumbnet-dev is installed in the host
+	#12126: vc4 has neon as hard dependency
+
 2019.02.4, Released July 10th, 2019
 
 	Important / security related fixes.
