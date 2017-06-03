From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Jun 2017 19:34:58 +0200
Subject: [Buildroot] [PATCH 1/2] package/gdbm: bump version to 1.13
Message-ID: <20170603173459.1012-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added sha256 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gdbm/gdbm.hash | 8 +++++---
 package/gdbm/gdbm.mk   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/gdbm/gdbm.hash b/package/gdbm/gdbm.hash
index 9759d8707..cab712e17 100644
--- a/package/gdbm/gdbm.hash
+++ b/package/gdbm/gdbm.hash
@@ -1,3 +1,5 @@
-# From http://lists.gnu.org/archive/html/info-gnu/2016-05/msg00009.html
-md5	9ce96ff4c99e74295ea19040931c8fb9	gdbm-1.12.tar.gz
-sha1	86513e8871bb376bc014e9e5a2d18a8e0a8ea2f5	gdbm-1.12.tar.gz
+# From http://www.gnu.org.ua/software/gdbm/download.html
+md5 8929dcda2a8de3fd2367bdbf66769376  gdbm-1.13.tar.gz
+sha1 7f2a8301497bbcac91808b011ca533380914fd21  gdbm-1.13.tar.gz
+# Locally computed
+sha256 9d252cbd7d793f7b12bcceaddda98d257c14f4d1890d851c386c37207000a253  gdbm-1.13.tar.gz
diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
index 72f958d33..290e8410e 100644
--- a/package/gdbm/gdbm.mk
+++ b/package/gdbm/gdbm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GDBM_VERSION = 1.12
+GDBM_VERSION = 1.13
 GDBM_SITE = $(BR2_GNU_MIRROR)/gdbm
 GDBM_LICENSE = GPL-3.0+
 GDBM_LICENSE_FILES = COPYING
-- 
2.11.0
