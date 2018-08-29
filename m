From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Aug 2018 17:56:17 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] Update for 2018.02.5
Message-ID: <20180829155619.84813813D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b07116644d617a0365d70eaae57c68ca273e6183
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 26 ++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9acc9c2e9e..0c50243c60 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,29 @@
+2018.02.5, Released August 29th, 2018
+
+	Important / security related fixes.
+
+	Defconfigs: Raspberrypi2: Bump rootfs size, T7680: Fix
+	genimage.cfg issue, ARM Juno: Bump ATF to v1.3 to fix build
+	issue.
+
+	Updated/fixed packages: acl, apache, attr, bind,
+	boot-wrapper-aarch64, brltty, bzip2, chrony, crda, cryptsetup,
+	dahdi-tools, dmidecode, dropbear, eigen, erlang, ffmpeg, gawk,
+	gcc, ghostscript, gnutls, ipsec-tools, libarchive, libfuse,
+	libopenssl, libselinux, libsoup, lighttpd, linuxptp,
+	lttng-modules, lttng-tools, lua-flu, lvm2, m4, makedevs,
+	mariadb, mbedtls, mesa3d-headers, mtd, ncurses, nodejs,
+	openssh, php, postgresql, python-django, qt5xmlpatterns, ruby,
+	samba4, shairport-sync, stress-ng, ti-utils, uboot-tools, vim,
+	waylandpp, wireless_tools, wireshark, wpa_supplicant, xorriso,
+	znc
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#10781: cryptsetup luksOpen container_file container causes..
+	#10986: Installing package attr when already supplied by..
+	#11191: xattr and check-package issue
+
 2018.02.4, Released July 21th, 2018
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 293ddd5468..5fb26c9733 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.02.4
+export BR2_VERSION := 2018.02.5
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1532126000
+BR2_VERSION_EPOCH = 1535550000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
