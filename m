From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Oct 2017 22:39:14 +0200
Subject: [Buildroot] [git commit] package/iprutils: bump version to 2.4.15.1
Message-ID: <20171005203341.B062480504@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c3fcb1e448acff9a029bf7117ed5191bc5f723f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iprutils/iprutils.hash | 8 ++++----
 package/iprutils/iprutils.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/iprutils/iprutils.hash b/package/iprutils/iprutils.hash
index 20a97da..e5c1754 100644
--- a/package/iprutils/iprutils.hash
+++ b/package/iprutils/iprutils.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/iprdd/files/iprutils%20for%202.6%20kernels/2.4.14/
-md5 8e5a4fb399f719882f22a6a540afeb0b  iprutils-2.4.14.1.tar.gz
-sha1 7e14b8c0b8909ca2fc50b85848de422cd01ffc9b  iprutils-2.4.14.1.tar.gz
+# From https://sourceforge.net/projects/iprdd/files/iprutils%20for%202.6%20kernels/2.4.15/
+md5 e4011051bba7470df3936cbba7dced98  iprutils-2.4.15.1.tar.gz
+sha1 ed6c362ee3c6bd9023ee60d0d1a1ce5543c27c41  iprutils-2.4.15.1.tar.gz
 # Locally computed:
-sha256 581403fbca17d4858383f8a6961c0e4aecb3f0f214a3680924238a94b9dc3ddf  iprutils-2.4.14.1.tar.gz
+sha256 a733e65f8fb19565f2ef5191eaa2a14d816fabed0fc254ab4bbf1a4c7800ebe5  iprutils-2.4.15.1.tar.gz
diff --git a/package/iprutils/iprutils.mk b/package/iprutils/iprutils.mk
index 0dc7b40..1165b3d 100644
--- a/package/iprutils/iprutils.mk
+++ b/package/iprutils/iprutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPRUTILS_VERSION_MAJOR = 2.4.14
+IPRUTILS_VERSION_MAJOR = 2.4.15
 IPRUTILS_VERSION = $(IPRUTILS_VERSION_MAJOR).1
 IPRUTILS_SITE = https://downloads.sourceforge.net/project/iprdd/iprutils%20for%202.6%20kernels/$(IPRUTILS_VERSION_MAJOR)
 IPRUTILS_DEPENDENCIES = ncurses libsysfs pciutils zlib
