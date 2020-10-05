From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  5 Oct 2020 19:20:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/libmaxminddb: bump to version 1.4.3
Message-ID: <20201005172051.2617176-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

https://github.com/maxmind/libmaxminddb/releases/tag/1.4.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmaxminddb/libmaxminddb.hash | 4 ++--
 package/libmaxminddb/libmaxminddb.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmaxminddb/libmaxminddb.hash b/package/libmaxminddb/libmaxminddb.hash
index a3ca682c2a..152123a934 100644
--- a/package/libmaxminddb/libmaxminddb.hash
+++ b/package/libmaxminddb/libmaxminddb.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	dd582aa971be23dee960ec33c67fb5fd38affba508e6f00ea75959dbd5aad156	libmaxminddb-1.4.2.tar.gz
-sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	LICENSE
+sha256  dd582aa971be23dee960ec33c67fb5fd38affba508e6f00ea75959dbd5aad156  libmaxminddb-1.4.3.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/libmaxminddb/libmaxminddb.mk b/package/libmaxminddb/libmaxminddb.mk
index 18e2eaee7d..eb28c99a4a 100644
--- a/package/libmaxminddb/libmaxminddb.mk
+++ b/package/libmaxminddb/libmaxminddb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMAXMINDDB_VERSION = 1.4.2
+LIBMAXMINDDB_VERSION = 1.4.3
 LIBMAXMINDDB_SITE = \
 	https://github.com/maxmind/libmaxminddb/releases/download/$(LIBMAXMINDDB_VERSION)
 LIBMAXMINDDB_INSTALL_STAGING = YES
-- 
2.28.0
