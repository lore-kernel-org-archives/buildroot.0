From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Jan 2019 22:12:51 +0100
Subject: [Buildroot] [git commit] Update for 2018.02.10
Message-ID: <20190131213914.59C20835FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96edc472f9adb211df64646585967512a933d501
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5a697610a0af405aac0f7bd98ddf38bc48bc1b7a)
[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/CHANGES b/CHANGES
index cc77a5d3b4..188b88dfd8 100644
--- a/CHANGES
+++ b/CHANGES
@@ -779,6 +779,35 @@
 	#10961: Grub2 fails to build for x86_64 when BR2_SSP_ALL is
 		enabled
 
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
