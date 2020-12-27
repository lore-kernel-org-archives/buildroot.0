From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 16:40:23 +0100
Subject: [Buildroot] [git commit] Update for 2020.08.3
Message-ID: <20201227155426.1CF2282DDE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea67cda8792f409ae23ea052da63d9abbc85fea2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b6a0f0d08de2d3942b63506cb4432f428ae3796f)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/CHANGES b/CHANGES
index a33ad56a71..84d5cee0c3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -168,6 +168,42 @@
 	#13236: Can't compile linux 5.4.8 (with gcc 10 on host)
 	#13286: The system hangs in vmware workstation on the line..
 
+2020.08.3, released December 27th, 2020
+
+	Important / security related fixes.
+
+	Infrastructure:
+	- cmake: fix host ccache handling for CMake 3.19
+	- meson: Forcibly disable binary stripping for
+	  target builds, enable for host builds
+	- golang: Fix HOST / TARGET directories for per-package builds
+
+	Defconfigs: Beaglebone Qt5: Fix ti-sgx related issues
+
+	Updated/fixed packages: apitrace, arm-trusted-firmware,
+	bustle, c-ares, ca-certificates, cage, cdrkit, cryptopp,
+	dhcpcd, docker-containerd, dtv-scan-tables, flare-engine,
+	ghostscript, gvfs, haproxy, imagemagick, imx-gpu-viv, jasper,
+	jemalloc, jpeg-turbo, libcamera, libcap, libcurl, libglib2,
+	libgpiod, libkrb5, libopenssl, libplist, libressl, libuv,
+	libuvw, lynx, mariadb, mbedtls, minidlna, mongodb, monkey,
+	musl, mutt, ncurses, netsnmp, netsurf, nodejs, opencv3,
+	openldap, openrc, opkg-utils, paho-mqtt-c, php, privoxy,
+	proftpd, python-crc16, python-flask-cors, python-lxml,
+	python-pip, python-pyparsing, python-pyqt5, qemu, qt5base,
+	raptor, rauc, ruby, setserial, shadowsocks-libev, slirp,
+	sqlcipher, thermald, ti-sgx-demos, tinycbor, unbound, vsftpd,
+	wireless-regdb, wireshark, wlroots, x11vnc, xen, xinetd,
+	xserver_xorg-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13276: libcap builds libcap.pc incorrectly
+	#13316: beaglebone_qt5_defconfig: PowerVR fails to start
+	#13336: thermald-1.9.1 compilation failure with musl 1.2.1
+	#13341: Mistake in /etc/init.d/S70vsftpd
+	#13416: dhcpcd start warning message: no such user dhcpcd
+
 2020.08.2, released November 16th, 2020
 
 	Important / security related fixes.
