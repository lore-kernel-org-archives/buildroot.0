From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Jan 2019 16:40:52 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] Update for 2018.11.2
Message-ID: <20190130153958.16876815F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=49dfa901e1b16563045bb0f5456fcadc9b62e380
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 37 +++++++++++++++++++++++++++++++++++++
 Makefile |  2 +-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index c4ccda92e7..f99c996eb5 100644
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
diff --git a/Makefile b/Makefile
index 998b571071..6379d069d4 100644
--- a/Makefile
+++ b/Makefile
@@ -92,7 +92,7 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.11.1
+export BR2_VERSION := 2018.11.2
 # Actual time the release is cut (for reproducible builds)
 BR2_VERSION_EPOCH = 1545257000
 
