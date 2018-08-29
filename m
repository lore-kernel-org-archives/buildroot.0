From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Aug 2018 18:23:57 +0200
Subject: [Buildroot] [git commit] Update for 2018.02.5
Message-ID: <20180829162649.BDD8A817D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b3b8d876ce77d871ae2d717327c515e2a23584d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b07116644d617a0365d70eaae57c68ca273e6183)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/CHANGES b/CHANGES
index 7ab40770d2..c1cecb8023 100644
--- a/CHANGES
+++ b/CHANGES
@@ -351,6 +351,32 @@
 	#10961: Grub2 fails to build for x86_64 when BR2_SSP_ALL is
 		enabled
 
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
