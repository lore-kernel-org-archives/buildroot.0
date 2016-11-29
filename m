From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 29 Nov 2016 11:29:19 +0000
Subject: [Buildroot] [PATCH next] sqlite: bump version to 3150200 (3.15.2)
Message-ID: <20161129112919.51786-1-Vincent.Riera@imgtec.com>
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
index bb24f94..7839dc9 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1 47404fe5c43936160ad0e90bddedc99367da7a9b  sqlite-autoconf-3150100.tar.gz
+sha1 31f52169bcfeef9efb61480d0950e928ad059552  sqlite-autoconf-3150200.tar.gz
 # Calculated based on the hash above
-sha256 5dfa89b7697ee3c2ac7b44e8e157e7f204bf999c866afcaa8bb1c7ff656ae2c5  sqlite-autoconf-3150100.tar.gz
+sha256 07b35063b9386865b78226cdaca9a299d938a87aaa8fdc4d73edb0cef30f3149  sqlite-autoconf-3150200.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 3f44f82..cb03249 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3150100
+SQLITE_VERSION = 3150200
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2016
 SQLITE_LICENSE = Public domain
-- 
2.10.1
