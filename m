From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 24 Nov 2017 19:15:03 +0100
Subject: [Buildroot] [PATCH 1/1] libmaxminddb: bump to version 1.3.0
Message-ID: <20171124181503.22227-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmaxminddb/libmaxminddb.hash | 3 ++-
 package/libmaxminddb/libmaxminddb.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libmaxminddb/libmaxminddb.hash b/package/libmaxminddb/libmaxminddb.hash
index 952a655d0..b8e52b833 100644
--- a/package/libmaxminddb/libmaxminddb.hash
+++ b/package/libmaxminddb/libmaxminddb.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256	06a0ec3d1496e1a7e30d74ea15373e0010bbe392ea1819c149aaf724dc57dd9a	libmaxminddb-1.2.1.tar.gz
+sha256	a8c7e245241cd427a41edb7eb40246ba125957510af2f88b93446fe7c2143705	libmaxminddb-1.3.0.tar.gz
+sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	LICENSE
diff --git a/package/libmaxminddb/libmaxminddb.mk b/package/libmaxminddb/libmaxminddb.mk
index f0678a05e..ccb5b35d0 100644
--- a/package/libmaxminddb/libmaxminddb.mk
+++ b/package/libmaxminddb/libmaxminddb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMAXMINDDB_VERSION = 1.2.1
+LIBMAXMINDDB_VERSION = 1.3.0
 LIBMAXMINDDB_SITE = $(call github,maxmind,libmaxminddb,$(LIBMAXMINDDB_VERSION))
 LIBMAXMINDDB_INSTALL_STAGING = YES
 LIBMAXMINDDB_LICENSE = Apache-2.0
-- 
2.14.1
