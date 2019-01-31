From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Jan 2019 17:23:43 +0100
Subject: [Buildroot] [git commit] Update for 2018.11.2
Message-ID: <20190131162254.10E4E80280@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b8ba9ec1aab8234505b6dc36ffab625364c82a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 49dfa901e1b16563045bb0f5456fcadc9b62e380)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/CHANGES b/CHANGES
index 56f023d3d3..cc77a5d3b4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,40 @@
+2018.11.2, Released January 30th, 2019
+
+	Important / security related fixes.
+
+	Defconfigs: Fixes for imx6slevk, imx7dsabresd, imx8mqevk, Lego
+	EV3, QEMU AArch64-virt
+
+	Download: Fix scp download handling
+
+	check-package: fix Python 3 support
+
+	get-developers: Fix behaviour when called from elsewhere than
+	the toplevel directory.
+
+	kconfig: Fix for make linux-menuconfig / uboot-menuconfig from
+	a clean tree when ccache is enabled.
+
+	cmake: Also set CMAKE_SYSTEM_VERSION in toolchainfile.cmake
+
+	Updated/fixed packages: acpica, apache, apr, avrdude, cargo,
+	cc-tool, dash, dhcpdump, dmalloc, docker-containerd, efivar,
+	fwts, glibc, gnuchess, gnupg2, go, leveldb, libarchive,
+	libassuan, libftdi1, libgpg-error, libhttpparser, libkcapi,
+	libmad, libsndfile, libsquish, liburiparser, libwebsock,
+	libxml2, lighttpd, llvm, lm-sensors, lua-msgpack-native, lxc,
+	mariadb, mbedtls, meson, mosquitto, netatalk, nodejs, odhcp6c,
+	openresolv, openssh, pango, patchelf, php, python-django,
+	python-numpy, python-pyyaml, rauc, rp-pppoe, s6-networking,
+	samba4, sdl_sound, shairport-sync, sqlite, subversion,
+	sunxi-cedarx, swupdate, systemd, tcpreplay, tekui, tmp2-abrmd,
+	tpm2-tools, tpm2-tss, udisks, unixodbc, usb_modeswitch,
+	webkitgtk, wireshark, wolfssl, xapp_rgb, xenomai, xerces
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11576: Unable to start apache with event MPM on raspberry pi 3
+
 2018.11.1, Released December 20th, 2018
 
 	Important / security related fixes.
