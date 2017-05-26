From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 26 May 2017 10:32:27 +0100
Subject: [Buildroot] [PATCH v2 next] sqlite: bump version to 3190200 (3.19.2)
Message-ID: <20170526093227.48974-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
Changes v1 -> v2:
 - Bump to 3.19.2 instead of 3.19.1
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 78748b003..093ec6d64 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1 74559194e1dd9b9d577cac001c0e9d370856671b  sqlite-autoconf-3180000.tar.gz
+sha1 597735a7039ebb105ea36366783ff0a3177f9131  sqlite-autoconf-3190200.tar.gz
 # Calculated based on the hash above
-sha256 a4e485ad3a16e054765baf6371826b5000beed07e626510896069c0bf013874c  sqlite-autoconf-3170000.tar.gz
+sha256 ca5361fb01cc3ad63d6fd4eb2cb0b6398e629595896d3558f7e121d37dac2ffc  sqlite-autoconf-3190200.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index af4c571df..17b4d2dd3 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3180000
+SQLITE_VERSION = 3190200
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2017
 SQLITE_LICENSE = Public domain
-- 
2.13.0
