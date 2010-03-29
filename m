From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Mar 2010 17:42:12 +0200
Subject: [Buildroot] [git commit master] libxml2: bump version
Message-ID: <20100329154235.C375E7FBA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a88d0ea6252f2d499efcfb0b96615baf10bb05e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                    |    6 +++---
 package/libxml2/libxml2.mk |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2ebdca9..de41091 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,9 +8,9 @@
 	New packages: librsync, lmbench, netperf, squid
 
 	Updated/fixed packages: busybox, dosfstools, e2fsprogs,
-	freetype, iperf, less, libgcrypt, libglib2, libpng, mdadm,
-	memstat, mtd-utils, nano, pppd, setserial, squashfs, wget,
-	xlib_libXfont
+	freetype, iperf, less, libgcrypt, libglib2, libpng, libxml2,
+	mdadm, memstat, mtd-utils, nano, pppd, setserial, squashfs,
+	wget, xlib_libXfont
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 16f83a9..0cffa06 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -3,7 +3,7 @@
 # libxml2
 #
 #############################################################
-LIBXML2_VERSION = 2.7.6
+LIBXML2_VERSION = 2.7.7
 LIBXML2_SOURCE = libxml2-sources-$(LIBXML2_VERSION).tar.gz
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 LIBXML2_INSTALL_STAGING = YES
-- 
1.6.3.3
