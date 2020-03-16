From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Mar 2020 17:40:30 +0100
Subject: [Buildroot] [git commit] Update for 2019.11.2
Message-ID: <20200316163100.D88A281EBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c10d345810e4221a4508ad4a72d17e3264f71b8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c23bac676738f8c8da2a8038df4ce9a123349008)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/CHANGES b/CHANGES
index 7433147e3c..54b20e7e29 100644
--- a/CHANGES
+++ b/CHANGES
@@ -154,6 +154,56 @@
 	#12536: Linux-Headers extracting failure
 	#12546: Ninja 1.10 build Error
 
+2019.11.2, released March 16th, 2020
+
+	Important / security related fixes.
+
+	Core: Ensure package-file-lists data is correct after
+	incremental builds as well.
+
+	Fix a race condition related to creating the output/staging
+	symlink on systems with coreutils < 8.27.
+
+	Toolchain: ARC tools bumped to arc-2019.09.
+
+	Br2-external: Fix patch handling when external linux-extension
+	packages are used. Fix compatibility with make 4.3+
+
+	Util-linux: Ensure that hwclock is built without GPLv3
+	code. Notice that builds with hwclock has contained
+	GPLv3-licensed code since util-linux 2.30 (Buildroot 2017.08+)
+
+	Updated/fixed packages: armadillo, at, bcm2835, binutils,
+	blktrace, bluez-alsa, bootstrap, brltty, busybox, cairo,
+	clamav, cog, cups, czmq, dnsmasq, docker-containerd, dovecot,
+	dovecot-pigeonhole, e2fsprogs, elf2flt, eudev, exim, exiv2,
+	fbgrab, gettext-tiny, glibc, go, grep, gst1-validate, guile,
+	imagemagick, jhead, jpeg-turbo, kvm-unit-tests, lapack,
+	libarchive, libcgroup, libdrm, libevent, libexif, libftdi1,
+	libgdiplus, libjpeg, libsigrok, libsndfile, libssh2,
+	libsvgtiny, libvncserver, libvorbis, libxml2, libxslt, linknx,
+	lxc, lz4, mariadb, mbedtls, meson, mongoose, mosquitto, musl,
+	ncurses, nodejs, ntfs-3g, ogre, opencv3, openjdk, openjpeg,
+	openrc, openswan, openvmtools, optee-test, patch, php, piglet,
+	postgresql, pppd, proftpd, pure-ftpd, python-django,
+	python-pyqt5, python-setuptools-scm-git-archive, python3,
+	qemu, qt5base, qt5tools, qt5virtualkeyboard, qt5webengine,
+	qwt, rdesktop, ruby, runc, samba4, shellinabox,
+	skeleton-init-openrc, smartmontools, spdlog, sqlcipher, squid,
+	suricata, swig, swupdate, sysklogd, taglib, thrift,
+	ti-cgt-pru, uclibc, util-linux, vorbis-tools, webkitgtk,
+	wireshark, wpebackend-fdo, wpewebkit, xen,
+	xserver_xorg-server, zeromq, zsh, zziplib
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11996: opencv3 SIGILL on Cortex-A5 with VFPv4-D16
+	#12331: meson issue
+	#12456: qtvirtualkeyboard: No such file or directory
+	#12461: libglib2 build files with deep directory structure
+	#12481: minicom fails when output directory path contains "m4"
+	#12606: fbgrab location has changed
+
 2019.11.1, released January 12th, 2020
 
 	Important / security related fixes.
