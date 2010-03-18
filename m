From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 18 Mar 2010 23:09:05 +0100
Subject: [Buildroot] [git commit master] libpng: bump version
Message-ID: <20100318220932.47261776FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8c57332bb846c56b5351dca28c9d11056ad46c16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                  |    2 +-
 package/libpng/libpng.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 95af76a..45fea9e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,7 +6,7 @@
 	X.org updated to 7.5.
 
 	Updated/fixed packages: busybox, dosfstools, e2fsprogs,
-	libglib2, mtd-utils, setserial, squashfs
+	libglib2, libpng, mtd-utils, setserial, squashfs
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 86e943c..7547884 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -3,7 +3,7 @@
 # libpng (Portable Network Graphic library)
 #
 #############################################################
-LIBPNG_VERSION:=1.2.38
+LIBPNG_VERSION:=1.2.43
 LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
 LIBPNG_LIBTOOL_PATCH = NO
-- 
1.6.3.3
