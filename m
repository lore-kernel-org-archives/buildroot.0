From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jun 2017 09:51:24 +0200
Subject: [Buildroot] [git commit] package/gdbm: bump version to 1.13
Message-ID: <20170604075143.05AE782A0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a91a43a7e84e95afb777f831513b0774ff2cc17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added sha256 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdbm/gdbm.hash | 8 +++++---
 package/gdbm/gdbm.mk   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/gdbm/gdbm.hash b/package/gdbm/gdbm.hash
index 9759d87..cab712e 100644
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
index 72f958d..290e841 100644
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
