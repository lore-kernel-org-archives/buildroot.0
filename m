From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 16 Mar 2010 16:30:00 +0100
Subject: [Buildroot] [git commit master] libglib2: bump version
Message-ID: <20100316153020.D4CE9776C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d3ea4f4cf52eea9bfe8e3837f66e199f1d6b7e04
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                      |    2 +-
 package/libglib2/libglib2.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index dce7efb..95af76a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,7 +6,7 @@
 	X.org updated to 7.5.
 
 	Updated/fixed packages: busybox, dosfstools, e2fsprogs,
-	mtd-utils, setserial, squashfs
+	libglib2, mtd-utils, setserial, squashfs
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 6e110f6..f122491 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 LIBGLIB2_VERSION_MAJOR = 2.22
-LIBGLIB2_VERSION_MINOR = 4
+LIBGLIB2_VERSION_MINOR = 5
 LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).$(LIBGLIB2_VERSION_MINOR)
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.bz2
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
-- 
1.6.3.3
