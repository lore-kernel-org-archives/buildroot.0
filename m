From: Ryan Coe <bluemrp9@gmail.com>
Date: Fri,  3 Nov 2017 06:30:02 -0700
Subject: [Buildroot] [PATCH 1/3] mariadb: bump version to 10.1.28
Message-ID: <20171103133004.8083-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://mariadb.com/kb/en/mariadb-10128-release-notes/
Changelog: https://mariadb.com/kb/en/mariadb-10128-changelog/

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/mariadb/mariadb.hash | 4 ++--
 package/mariadb/mariadb.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index fd5625c8e7..1483bf70da 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,5 +1,5 @@
-# From https://downloads.mariadb.org/mariadb/10.1.26/
-sha256 ba88b1cb9967dea2909938a34ba89373b162b0d83e5c98a0f1c94540156bf73d  mariadb-10.1.26.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.1.28/
+sha256 292dc8fff420c4bdaf3a2c3381ec3c99292965db2b09de0d7fec414c00032bbd  mariadb-10.1.28.tar.gz
 
 # Hash for license files
 sha256 69ce89a0cadbe35a858398c258be93c388715e84fc0ca04e5a1fd1aa9770dd3a  README
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 47c7906582..9d30d8f207 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.1.26
+MARIADB_VERSION = 10.1.28
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
-- 
2.15.0
