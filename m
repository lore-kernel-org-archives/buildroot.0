From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Aug 2018 17:02:15 +0200
Subject: [Buildroot] [git commit] Update for 2018.05.2
Message-ID: <20180828150711.2143B814B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b914fbdc1fa6cdf55b208b97857bb650a7e04341
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop Makefile changes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4b8deaf34cca1a1c0196ab7e91ceb9720923d6aa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/CHANGES b/CHANGES
index d0744353bc..7ab40770d2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -97,6 +97,32 @@
 	#11121: statfs call corrupts memory struct statfs  too small
 	#11181: Switching toolchain does not work
 
+2018.05.2, Released August 28th, 2018
+
+	Important / security related fixes.
+
+	Defconfigs: Raspberrypi2: Bump rootfs size, T7680: Fix
+	genimage.cfg issue, ARM Juno: Bump ATF to v1.3 to fix build
+	issue.
+
+	Updated/fixed packages: acl, attr, apache, bind,
+	boot-wrapper-aarch64, brltty, bzip2, chrony, crda, cryptsetup,
+	dahdi-tools, dmidecode, dropbear, eigen, ffmpeg, gawk, gcc,
+	ghostscript, gnutls, imx-gpu-viv, ipsec-tools, libarchive,
+	libfuse, libglib2, libopenssl, libselinux, libsoup, lighttpd,
+	linuxptp, lttng-modules, lttng-tools, lua-flu, lvm2, m4,
+	makedevs, mariadb, mbedtls, mesa3d-heders, mtd, ncurses,
+	nodejs, openssh, php, python-django, rauc, ruby, samba4,
+	stress-ng, ti-utils, uboot-tools, uclibc, vim, waylandpp,
+	wireless_tools, wireless-regdb, wireshark, wpa_supplicant,
+	xorriso, znc
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#10781: cryptsetup luksOpen container_file container causes..
+	#10986: Installing package attr when already supplied by..
+	#11191: xattr and check-package issue
+
 2018.05.1, Released July 20th, 2018
 
 	Important / security related fixes.
