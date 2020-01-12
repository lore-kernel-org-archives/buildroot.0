From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Jan 2020 15:50:47 +0100
Subject: [Buildroot] [git commit] Update for 2019.11.1
Message-ID: <20200112144448.ACF068B581@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=538d277312e365f8862d0a6acefd0948f5eef49b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 57fbebac60f5247744882b3729ee9b2dc32c8f15)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/CHANGES b/CHANGES
index 3c3fc1d768..b4d6faa38a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,41 @@
+2019.11.1, released January 12th, 2020
+
+	Important / security related fixes.
+
+	Infrastructure: kconfig: Fix reconfigure logic, python: Ensure
+	correct compiler and linker flags are used for compiled code
+
+	utils/scanpypi: Remind users to update DEVELOPERS
+
+	Defconfigs: imx6-sabresd: Fix the Qt5 display names,
+	imx8: Drop extra copy of U-Boot DTB
+
+	Updated/fixed packages: acsccid, bitcoin, boost, busybox,
+	cc-tool, cmocka, cpio, cups, dante, dialog, dillo, docker-cli,
+	docker-containerd, docker-engine, easy-rsa, ebtables,
+	ecryptfs-utils, efl, ffmpeg, gdb, git, glibc, gnupg2, go,
+	gpsd, grpc, gst1-plugins-bad, iputils, jasper,
+	kf5-kcoreaddons, leveldb, libarchive, libfribi, libgit2,
+	libkrb5, libp11, librsvg, libssh, libtomcrypt, libuio, libv4l,
+	lirc-tools, log4cplus, lrzip, lvm2, mali-t76x,
+	matchbox-desktop, mender-grubenv, mmc-utils, mosquitto,
+	nodejs, ntp, openipmi, opencv3, openpowerlink, openrc, pango,
+	perl-sys-cpu, pimd, postgresql, pulseaudio, python-brotli,
+	python-coherence, python-crc16, python-django, python-dpkt,
+	python-gobject, python-pyasn-modules, python-pypcap,
+	python-pyqt5, python-subprocess32, python3, qpdf,
+	qt-webkit-kiosk, qt5virtualkeyboard, qt5webengine, quota,
+	rabbitmq-c, rauc, rpcbind, rtl8821au, runc, rygel, samba4,
+	sdl2, setserial, snort, spidev_test,
+	sunxi-mali-mainline-driver, syslog-ng, sysrepo, tcllib, tftpd,
+	usbmount, w_scan, wavpack, wsapi, wsapi-fcgi, wsapi-xavante,
+	x265, xserver_xorg-server, ytree, zip
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#12121: PyQt5.QtSerialPort and other modules not being built
+	#12286: Can't import gobject in python 3.8
+
 2019.11, released December 1st, 2019
 
 	Various fixes.
