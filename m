From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 Oct 2017 00:09:12 +0200
Subject: [Buildroot] [git commit] Update for 2017.08.1
Message-ID: <20171023220619.70158803FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2b107560c4e490ac588fe3a72bfeca4dc6a9e70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 20b6624f4bb84353e690d897688fd7ac12d6a881)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/CHANGES b/CHANGES
index c60d17d..23e5fa0 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,6 +4,40 @@
 	bit bigger than before. To remove unneeded MIBS, you should use a
 	post-build script.
 
+2017.08.1, Released October 23rd, 2017
+
+	Important / security related fixes.
+
+	Webkitgtk bumped to the 2.18.x series, fixing a large number
+	of security issues.
+
+	Defconfigs: galileo: fix ext4 related kernel config, bump
+	kernel for gcc 6.x compatibility, enable wchar support for
+	grub2. wandboard: correct rootfs offset
+
+	support: Ensure gzip compression level 6 is used for git
+	tarballs. check-bin-arch: Correctly handle (ignore) symbolic
+	links. check-rpath: Also handle PIE binaries
+
+	External toolchain: Correctly handle glibc Buildroot
+	toolchains built with merged /usr
+
+	musl: fix ARMv4 build with binutils 2.27.51+, fix for
+	CVE-2017-15650
+
+	Updated/fixed packages: apache, augeas, bind, bluez5_utils,
+	busybox, bzip2, cmake, dnsmasq, ejabberd, gcc, git, go, ffmpeg, file,
+	flashrom, gd, gdk-pixbug, gnupg2, hostapd, ifupdown-scripts,
+	imagemagick, iucode-tool, kernel-module-imx-gpu-viv, lame,
+	libarchive, libcurl, libffi, libidn, libmbim, libnspr, libnss,
+	libressl, librsync, libsoup, libxml2, libzip, mbedtls, musl,
+	netplug, nginx, openvpn, pkgconf, poppler, proxychains-ng,
+	qemu, qt, rpi-userland, syslog, ruby, samba4, softether,
+	sqlite, strongswan, subversion, supertuxkart, supervisor, tcpdump,
+	tor, unrar, urq, vboot-utils, webkitgtk, wpa_supplicant, xen,
+	xmlstarlet, xlib_libXfont, xlib_libXfont2,
+	xserver_xorg-server, zsh
+
 2017.08, Released September 1st, 2017
 
 	Minor fixes.
