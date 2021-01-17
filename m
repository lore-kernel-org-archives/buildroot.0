From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jan 2021 09:49:56 +0100
Subject: [Buildroot] [git commit] package/libva-utils: bump version to 2.10.0
Message-ID: <20210117083229.4757E8658C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70fe8518cd4a64235e94c264f4a3dc759c2c5027
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libva-utils/libva-utils.hash | 6 +++---
 package/libva-utils/libva-utils.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index 208da06592..349fcc42ae 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,5 +1,5 @@
-# From https://github.com/intel/libva-utils/releases/download/2.9.1/libva-utils-2.9.1.tar.bz2.sha1sum
-sha1  92d8118e112bca8d8497c10a5f896610883a9775  libva-utils-2.9.1.tar.bz2
+# From https://github.com/intel/libva-utils/releases/download/2.10.0/libva-utils-2.10.0.tar.bz2.sha1sum
+sha1  083a31354d2d49a4b9b8d4bccd6e7b77fc447154  libva-utils-2.10.0.tar.bz2
 # Locally computed
-sha256  66558051b280f0f82781b80d355c198105235b5887e6fcb703ef1a679646c814  libva-utils-2.9.1.tar.bz2
+sha256  33f06929faa395f55ec816432679219c56d70850bf465c848f0418e8a4f0352b  libva-utils-2.10.0.tar.bz2
 sha256  c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index 2e26df7100..4634ba4eb7 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.9.1
+LIBVA_UTILS_VERSION = 2.10.0
 LIBVA_UTILS_SOURCE = libva-utils-$(LIBVA_UTILS_VERSION).tar.bz2
 LIBVA_UTILS_SITE = https://github.com/intel/libva-utils/releases/download/$(LIBVA_UTILS_VERSION)
 LIBVA_UTILS_LICENSE = MIT
