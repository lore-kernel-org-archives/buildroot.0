From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 20 Jan 2018 18:14:27 +0100
Subject: [Buildroot] [PATCH 1/1] libmaxminddb: bump to version 1.3.2
Message-ID: <20180120171427.10565-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmaxminddb/libmaxminddb.hash | 2 +-
 package/libmaxminddb/libmaxminddb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmaxminddb/libmaxminddb.hash b/package/libmaxminddb/libmaxminddb.hash
index 55a0ed6bed..073458a351 100644
--- a/package/libmaxminddb/libmaxminddb.hash
+++ b/package/libmaxminddb/libmaxminddb.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	7dcb04daf3c760464d32101c728986bf1b544e17104af81c5b0e2544c771664e	libmaxminddb-1.3.1.tar.gz
+sha256	c0785521c7e5515f1169db90ed6e51bc2a5a000377d0fbad87e4d5a791a6e364	libmaxminddb-1.3.2.tar.gz
 sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	LICENSE
diff --git a/package/libmaxminddb/libmaxminddb.mk b/package/libmaxminddb/libmaxminddb.mk
index d035e27e18..4d4f582c21 100644
--- a/package/libmaxminddb/libmaxminddb.mk
+++ b/package/libmaxminddb/libmaxminddb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMAXMINDDB_VERSION = 1.3.1
+LIBMAXMINDDB_VERSION = 1.3.2
 LIBMAXMINDDB_SITE = $(call github,maxmind,libmaxminddb,$(LIBMAXMINDDB_VERSION))
 LIBMAXMINDDB_INSTALL_STAGING = YES
 LIBMAXMINDDB_LICENSE = Apache-2.0
-- 
2.14.1
