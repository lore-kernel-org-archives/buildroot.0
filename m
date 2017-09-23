From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Sep 2017 11:04:39 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] CHANGES: update with
	recent changes
Message-ID: <20170923085731.2BA9680E0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8fbd4de7c24ffb762e028afccc87253bf2b9affc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/CHANGES b/CHANGES
index 7393642..99ee902 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,31 @@
+2017.02.6, Not yet released
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
+	gdk-pixbuf, git, gnupg, gpsd, grub2, imagemagick, iostat,
+	iucode-tool, jack2, libarchive, libcurl, libgcrypt,
+	libphidget, librsync, librsvg, libsoup, libxml2, linux-tools,
+	lua, mariadb, mbedtls, mediastreamer, minidlna, netplug,
+	nss-pam-ldapd, nvidia-driver, openjpeg, postgresql,
+	proxychains-ng, python-libconfig, python-service-identity, qt,
+	rpcbind, ruby, samba4, squashfs, squid, strongswan,
+	subversion, supervisor, sysvinit, tcpdump, transmission,
+	unrar, valgrind, vim, webkitgtk, whois, xen, zmqpp
+
+	Issues resolved (http://bugs.buildroot.org):
+
+	#10141: Squashfs extended attribute failures
+	#10261: Grub2 fails to build for x86_64
+	#10276: BR2_PACKAGE_LINUX_TOOLS_GPIO fails for MIPS with...
+
 2017.02.5, Released July 27th, 2017
 
 	Important / security related fixes.
