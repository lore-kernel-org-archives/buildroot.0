From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Apr 2021 12:20:21 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] CHANGES: Add last minute
 2021.02.1 updates
Message-ID: <20210407095557.01FEF8189B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6668381363364c89d43689322cc5ce4249c8fd9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Busybox and python-django have been updated as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/CHANGES b/CHANGES
index 372082cbe7..9afcc4ab78 100644
--- a/CHANGES
+++ b/CHANGES
@@ -27,13 +27,13 @@
 	Defconfigs: Correct Beaglebone QT file system overlay
 
 	Updated/fixed packages: alsa-utils, at91bootstrap3,
-	batman-adv, binutils, botan, bridge-utils, ca-certificates,
-	cog, coreutils, diffutils, dmidecode, docker-cli,
-	docker-containerd, docker-engine, efivar, fetchmail, frr,
-	genimage, git, gnutls, go, grub2, gst-omx, gst1-devtools,
-	gst1-libav, gst1-plugins-bad, gst1-plugins-base,
-	gst1-plugins-good, gst1-plugins-ugly, gst1-python,
-	gst1-rtsp-server, gst1-vaapi, gstreamer1,
+	batman-adv, binutils, botan, bridge-utils, busybox,
+	ca-certificates, cog, coreutils, diffutils, dmidecode,
+	docker-cli, docker-containerd, docker-engine, efivar,
+	fetchmail, frr, genimage, git, gnutls, go, grub2, gst-omx,
+	gst1-devtools, gst1-libav, gst1-plugins-bad,
+	gst1-plugins-base, gst1-plugins-good, gst1-plugins-ugly,
+	gst1-python, gst1-rtsp-server, gst1-vaapi, gstreamer1,
 	gstreamer1-editing-services, haproxy, haserl, hwloc,
 	irqbalance, jasper, kexec, kexec-lite, kismet, kodi, libcurl,
 	libfreeglut, libgcrypt, libgeos, libglib2, libopenssl, libqmi,
@@ -42,9 +42,9 @@
 	mcelog, mender, micropython, mongoose, mosquitto, mpd,
 	netsnmp, nodejs, openmpi, openssh, openvpn, opkg-utils,
 	optee-client, optee-test, perl, php, proftpd, protobuf,
-	python-jinja2, python-lxml, python-paramiko, python-py,
-	python-pygments, python-rpi-ws281x, python-urllib3, python3,
-	qt5webkit, qwt, rpm, samba4, sconeserver, sdl2, shim,
+	python-django, python-jinja2, python-lxml, python-paramiko,
+	python-py, python-pygments, python-rpi-ws281x, python-urllib3,
+	python3, qt5webkit, qwt, rpm, samba4, sconeserver, sdl2, shim,
 	sqlcipher, squid, sysklogd, syslinux, sysvinit, tor,
 	transmission, tzdata, uboot, uclibc, upx, webkitgtk,
 	wireshark, wpebackend-fdo, wpewebkit, xen, zstd
