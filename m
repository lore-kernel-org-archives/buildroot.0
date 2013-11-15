From: sonic.adi at gmail.com <sonic.adi@gmail.com>
Date: Fri, 15 Nov 2013 17:30:38 +0800
Subject: [Buildroot] [PATCH] e2fsprogs: Rename the first patch to match the
	naming policy.
Message-ID: <1384507838-4675-1-git-send-email-Sonic.adi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sonic Zhang <sonic.zhang@analog.com>

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
---
 package/e2fsprogs/e2fsprogs-0001-sem-init-libs.patch | 11 +++++++++++
 package/e2fsprogs/e2fsprogs-sem-init-libs.patch      | 11 -----------
 2 files changed, 11 insertions(+), 11 deletions(-)
 create mode 100644 package/e2fsprogs/e2fsprogs-0001-sem-init-libs.patch
 delete mode 100644 package/e2fsprogs/e2fsprogs-sem-init-libs.patch

diff --git a/package/e2fsprogs/e2fsprogs-0001-sem-init-libs.patch b/package/e2fsprogs/e2fsprogs-0001-sem-init-libs.patch
new file mode 100644
index 0000000..56f1cc2
--- /dev/null
+++ b/package/e2fsprogs/e2fsprogs-0001-sem-init-libs.patch
@@ -0,0 +1,11 @@
+--- e2fsprogs-1.41.9/MCONFIG.in.orig	2009-10-07 20:25:07.000000000 +0800
++++ e2fsprogs-1.41.9/MCONFIG.in	2009-10-07 20:21:41.000000000 +0800
+@@ -85,7 +85,7 @@
+ #
+ LIB = $(top_builddir)/lib
+ LIBSS = $(LIB)/libss at LIB_EXT@ @PRIVATE_LIBS_CMT@ @DLOPEN_LIB@
+-LIBCOM_ERR = $(LIB)/libcom_err at LIB_EXT@ @PRIVATE_LIBS_CMT@ @SEM_INIT_LIB@
++LIBCOM_ERR = $(LIB)/libcom_err at LIB_EXT@ @SEM_INIT_LIB@
+ LIBE2P = $(LIB)/libe2p at LIB_EXT@
+ LIBEXT2FS = $(LIB)/libext2fs at LIB_EXT@
+ LIBUUID = @LIBUUID@ @SOCKET_LIB@
diff --git a/package/e2fsprogs/e2fsprogs-sem-init-libs.patch b/package/e2fsprogs/e2fsprogs-sem-init-libs.patch
deleted file mode 100644
index 56f1cc2..0000000
--- a/package/e2fsprogs/e2fsprogs-sem-init-libs.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- e2fsprogs-1.41.9/MCONFIG.in.orig	2009-10-07 20:25:07.000000000 +0800
-+++ e2fsprogs-1.41.9/MCONFIG.in	2009-10-07 20:21:41.000000000 +0800
-@@ -85,7 +85,7 @@
- #
- LIB = $(top_builddir)/lib
- LIBSS = $(LIB)/libss at LIB_EXT@ @PRIVATE_LIBS_CMT@ @DLOPEN_LIB@
--LIBCOM_ERR = $(LIB)/libcom_err at LIB_EXT@ @PRIVATE_LIBS_CMT@ @SEM_INIT_LIB@
-+LIBCOM_ERR = $(LIB)/libcom_err at LIB_EXT@ @SEM_INIT_LIB@
- LIBE2P = $(LIB)/libe2p at LIB_EXT@
- LIBEXT2FS = $(LIB)/libext2fs at LIB_EXT@
- LIBUUID = @LIBUUID@ @SOCKET_LIB@
-- 
1.8.2.3
