From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Jan 2019 17:37:58 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] Update for 2018.02.10
Message-ID: <20190131163703.79322814DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a697610a0af405aac0f7bd98ddf38bc48bc1b7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 29 +++++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 989fac414c..2bc4258a06 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,32 @@
+2018.02.10, Released January 31th, 2019
+
+	Important / security related fixes.
+
+	Defconfigs: Fixes for Lego EV3, QEMU AArch64-virt
+
+	check-package: fix Python 3 support
+
+	get-developers: Fix behaviour when called from elsewhere than
+	the toplevel directory.
+
+	cmake: Also set CMAKE_SYSTEM_VERSION in toolchainfile.cmake
+
+	Updated/fixed packages: acpica, apache, apr, asterisk,
+	avrdude, cargo, cc-tool, dash, dhcpdump, dmalloc, gnuchess,
+	gnupg2, leveldb, libarchive, libassuan, libftdi1,
+	libgpg-error, libhttpparser, libmad, libsndfile, libsquish,
+	liburiparser, libwebsock, libxml2, lighttpd, lm-sensors,
+	lua-msgpack-native, mbedtls, mosquitto, netatalk, nodejs,
+	openssh, pango, patchelf, php, python-django, python-pyyaml,
+	rauc, rp-pppoe, s6-networking, samba4, sdl_sound,
+	shairport-sync, sqlite, subversion, sunxi-cedarx, tcpreplay,
+	tekui, usb_modeswitch, webkitgtk, wireshark, wolfssl,
+	xapp_rgb, xenomai, xerces
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#11576: Unable to start apache with event MPM on raspberry pi 3
+
 2018.02.9, Released December 20th, 2018
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 03ea4ffd9e..c07ff3dae5 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.02.9
+export BR2_VERSION := 2018.02.10
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1545305000
+BR2_VERSION_EPOCH = 1548952000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
