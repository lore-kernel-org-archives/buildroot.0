From: Ryan Coe <bluemrp9@gmail.com>
Date: Mon, 16 Apr 2018 11:40:00 -0700
Subject: [Buildroot] [PATCH 1/1] mariadb: bump version to 10.1.32
Message-ID: <20180416184000.2449-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://mariadb.com/kb/en/mariadb-10132-release-notes/
Changelog: https://mariadb.com/kb/en/mariadb-10132-changelog/

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/mariadb/mariadb.hash | 4 ++--
 package/mariadb/mariadb.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index cc1e353ab7..b8b2dde374 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,5 +1,5 @@
-# From https://downloads.mariadb.org/mariadb/10.1.31/
-sha256 ab7641c2fe4e5289da6141766a9c3350e013def56fafd6f1377080bc8048b2e6  mariadb-10.1.31.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.1.32/
+sha256 0e2aae6a6a190d07c8e36e87dd43377057fa82651ca3c583462563f3e9369096  mariadb-10.1.32.tar.gz
 
 # Hash for license files
 sha256 69ce89a0cadbe35a858398c258be93c388715e84fc0ca04e5a1fd1aa9770dd3a  README
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 54eafc1702..391655fb0a 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.1.31
+MARIADB_VERSION = 10.1.32
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
-- 
2.17.0
