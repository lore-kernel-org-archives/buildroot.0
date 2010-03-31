From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 31 Mar 2010 10:53:12 +0200
Subject: [Buildroot] [git commit master] php: bump version
Message-ID: <20100331085411.9514420AEA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0fd372457e6af71a4f5f47827af61816a83ac67d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1429

[Peter: stick to bz2 upstream]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    5 +++--
 package/php/php.mk |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index d802538..6500960 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,8 +9,8 @@
 
 	Updated/fixed packages: busybox, dosfstools, e2fsprogs,
 	freetype, iperf, less, libgcrypt, libglib2, libpng, libxml2,
-	mdadm, memstat, mtd-utils, nano, pppd, setserial, squashfs,
-	wget, xlib_libXfont
+	mdadm, memstat, mtd-utils, nano, php, pppd, setserial,
+	squashfs, wget, xlib_libXfont
 
 	Issues resolved (http://bugs.uclibc.org):
 
@@ -27,6 +27,7 @@
 	#1303: Add librsync package
 	#1327: mtd-utils compile failure due to lack of --sysroot in CFLAGS
 	#1345: Bump pppd to 2.4.5 and convert to Makefile.autotools.in
+	#1429: [SECURITY] Update php to 5.2.13
 	#1441: Add binutils 2.20.1
 	#1447: Package installation on target with debug symbols is broken
 
diff --git a/package/php/php.mk b/package/php/php.mk
index 74fb4d9..cd5ed9e 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PHP_VERSION = 5.2.12
+PHP_VERSION = 5.2.13
 PHP_SOURCE = php-$(PHP_VERSION).tar.bz2
 PHP_SITE = http://www.php.net/distributions
 PHP_INSTALL_STAGING = YES
-- 
1.6.3.3
