From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 18:22:23 +0100
Subject: [Buildroot] [git commit] Update for 2020.02.9
Message-ID: <20201227170717.723BF82DDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97d3e7a772eee563919b876abc6684c9c1695c25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 15a05e6d5a875759d217d61b3c7b31ec87ea4eb5)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/CHANGES b/CHANGES
index 84d5cee0c3..51710d03ea 100644
--- a/CHANGES
+++ b/CHANGES
@@ -738,6 +738,39 @@
 	#12796: Update OpenSSL to Version 1.1.1g to patch  CVE-2020-1967
 	#12811: bootstrap stuck and no login prompt
 
+2020.02.9, released December 27th, 2020
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
+	bustle, c-ares, ca-certificates, cdrkit, cryptopp, dhcpcd,
+	docker-containerd, dtv-scan-tables, flare-engine, ghostscript,
+	haproxy, imagemagick, imx-gpu-viv, jasper, jemalloc,
+	jpeg-turbo, libcap, libcurl, libglib2, libgpiod, libkrb5,
+	libopenssl, libplist, libressl, libuv, libuvw, lynx, mariadb,
+	mbedtls, minidlna, monkey, musl, mutt, ncurses, netsnmp,
+	nodejs, opencv3, openldap, openrc, opkg-utils, paho-mqtt-c,
+	php, privoxy, proftpd, python-crc16, python-flask-cors,
+	python-lxml, python-pip, python-pyparsing, python-pyqt5, qemu,
+	qt5base, raptor, rauc, ruby, setserial, shadowsocks-libev,
+	slirp, sqlcipher, ti-sgx-demos, tinycbor, vsftpd,
+	wireless-regdb, wireshark, x11vnc, xen, xinetd,
+	xserver_xorg-server
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#13276: libcap builds libcap.pc incorrectly
+	#13316: beaglebone_qt5_defconfig: PowerVR fails to start
+	#13341: Mistake in /etc/init.d/S70vsftpd
+
 2020.02.8, released November 16th, 2020
 
 	Important / security related fixes.
