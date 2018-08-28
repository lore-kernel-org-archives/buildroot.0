From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Aug 2018 16:22:25 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] Update for 2018.05.2
Message-ID: <20180828142253.512218146C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b8deaf34cca1a1c0196ab7e91ceb9720923d6aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES  | 26 ++++++++++++++++++++++++++
 Makefile |  4 ++--
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index d41642b031..548b49ca7f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,29 @@
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
diff --git a/Makefile b/Makefile
index 13b6283cc7..32b848c189 100644
--- a/Makefile
+++ b/Makefile
@@ -87,9 +87,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2018.05.1
+export BR2_VERSION := 2018.05.2
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1532040000
+BR2_VERSION_EPOCH = 1535466000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
