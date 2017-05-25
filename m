From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 25 May 2017 10:42:54 +0100
Subject: [Buildroot] [PATCH next] sqlite: bump version to 3190100 (3.19.1)
Message-ID: <20170525094254.60145-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 78748b003..3547300ff 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1 74559194e1dd9b9d577cac001c0e9d370856671b  sqlite-autoconf-3180000.tar.gz
+sha1 7906083f3d744c7c1ccf8c0f79caaacfd58b363d  sqlite-autoconf-3190100.tar.gz
 # Calculated based on the hash above
-sha256 a4e485ad3a16e054765baf6371826b5000beed07e626510896069c0bf013874c  sqlite-autoconf-3170000.tar.gz
+sha256 b516e665952c6659638eab3283f09f317afb212fd8e39d6415b4b6259c37b0f5  sqlite-autoconf-3190000.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index af4c571df..ca0005963 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3180000
+SQLITE_VERSION = 3190000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2017
 SQLITE_LICENSE = Public domain
-- 
2.13.0
