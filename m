From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Sep 2017 22:17:59 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] Update for 2017.02.6
Message-ID: <20170924203032.9772F80007@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ee6c1d60ebe1285e7f07afa0f8f9107ce0b3506
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 21 +++++++++++----------
 Makefile |  4 ++--
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/CHANGES b/CHANGES
index 99ee902..56f1c32 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2017.02.6, Not yet released
+2017.02.6, Released September 24th, 2017
 
 	Important / security related fixes.
 
@@ -10,15 +10,16 @@
 	Updated/fixed packages: apache, bcusdk, bind, binutils,
 	bluez5_utils, botan, cmake, connman, dbus, dialog, e2fsprogs,
 	faad2, fakeroot, ffmpeg, file, flashrom, gcc, gd, gdb,
-	gdk-pixbuf, git, gnupg, gpsd, grub2, imagemagick, iostat,
-	iucode-tool, jack2, libarchive, libcurl, libgcrypt,
-	libphidget, librsync, librsvg, libsoup, libxml2, linux-tools,
-	lua, mariadb, mbedtls, mediastreamer, minidlna, netplug,
-	nss-pam-ldapd, nvidia-driver, openjpeg, postgresql,
-	proxychains-ng, python-libconfig, python-service-identity, qt,
-	rpcbind, ruby, samba4, squashfs, squid, strongswan,
-	subversion, supervisor, sysvinit, tcpdump, transmission,
-	unrar, valgrind, vim, webkitgtk, whois, xen, zmqpp
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
 
 	Issues resolved (http://bugs.buildroot.org):
 
diff --git a/Makefile b/Makefile
index 9b51790..3514d93 100644
--- a/Makefile
+++ b/Makefile
@@ -86,9 +86,9 @@ else # umask / $(CURDIR) / $(O)
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2017.02.5
+export BR2_VERSION := 2017.02.6
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1501100000
+BR2_VERSION_EPOCH = 1506285000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
