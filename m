From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 3 Apr 2017 11:13:57 +0100
Subject: [Buildroot] [PATCH] sqlite: bump version to 3180000 (3.18.0)
Message-ID: <20170403101357.2649-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 5c5b8ec..78748b0 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1 7bcff1c158ed9e2c0e159c1b4b6c36d4d65dff8c  sqlite-autoconf-3170000.tar.gz
+sha1 74559194e1dd9b9d577cac001c0e9d370856671b  sqlite-autoconf-3180000.tar.gz
 # Calculated based on the hash above
 sha256 a4e485ad3a16e054765baf6371826b5000beed07e626510896069c0bf013874c  sqlite-autoconf-3170000.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 76babd3..af4c571 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3170000
+SQLITE_VERSION = 3180000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2017
 SQLITE_LICENSE = Public domain
-- 
2.10.2
