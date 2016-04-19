From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 19 Apr 2016 10:39:22 +0100
Subject: [Buildroot] [PATCH] sqlite: bump version to 3120200
Message-ID: <1461058762-46560-1-git-send-email-Vincent.Riera@imgtec.com>
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
index df0d59b..a005cb1 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1	fa1f3dbf6e2e8c6d14125b2eceda5b2e16a19f1f	sqlite-autoconf-3120100.tar.gz
+sha1 b43c2e7238e54c50b95fbbd85c48792f4f39af8c  sqlite-autoconf-3120200.tar.gz
 # Calculated based on the hash above
-sha256	1c038519862b3983b0475f3ed3143ce4bbfcd21bfbd0741192f415838c831a7c	sqlite-autoconf-3120100.tar.gz
+sha256 fd00770c9afd39db555c78400e52f55e8bd6568c78be23561abb472a22d09abb  sqlite-autoconf-3120200.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 18abfe1..2f9b6ce 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3120100
+SQLITE_VERSION = 3120200
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2016
 SQLITE_LICENSE = Public domain
-- 
2.7.3
