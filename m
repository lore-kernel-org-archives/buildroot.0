From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Sep 2017 22:54:12 +0200
Subject: [Buildroot] [git commit] Update for 2017.02.6
Message-ID: <20170924204715.A688880330@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40f8a0134a70074db598d864a322c568f49d2e96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8ee6c1d60ebe1285e7f07afa0f8f9107ce0b3506)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/CHANGES b/CHANGES
index c042bf5..c942fbf 100644
--- a/CHANGES
+++ b/CHANGES
@@ -493,6 +493,35 @@
 	#9846: musl libc not installed correctly in target folder
 	#9856: build libubox failed on ubuntu 17.04 64bit
 
+2017.02.6, Released September 24th, 2017
+
+	Important / security related fixes.
+
+	Cmake: Ensure correct pkg-config is used when building host
+	packages
+
+	fs/iso9660: Ensure files from earlier builds are not included.
+
+	Updated/fixed packages: apache, bcusdk, bind, binutils,
+	bluez5_utils, botan, cmake, connman, dbus, dialog, e2fsprogs,
+	faad2, fakeroot, ffmpeg, file, flashrom, gcc, gd, gdb,
+	gdk-pixbuf, git, gnupg, gpsd, grub2, gst1-plugins-bad,
+	imagemagick, iostat, iucode-tool, jack2, libarchive, libcurl,
+	libgcrypt, libidn, libphidget, librsync, librsvg, libsoup,
+	libxml2, linux-tools, lua, mariadb, mbedtls, mediastreamer,
+	minidlna, netplug, nss-pam-ldapd, nvidia-driver, openjpeg,
+	postgresql, proxychains-ng, python-libconfig,
+	python-service-identity, qt, rpcbind, ruby, samba4, squashfs,
+	squid, strongswan, subversion, supervisor, sysvinit, tcpdump,
+	tor, transmission, unrar, valgrind, vim, webkitgtk, whois,
+	xen, zmqpp
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#10141: Squashfs extended attribute failures
+	#10261: Grub2 fails to build for x86_64
+	#10276: BR2_PACKAGE_LINUX_TOOLS_GPIO fails for MIPS with...
+
 2017.02.5, Released July 27th, 2017
 
 	Important / security related fixes.
