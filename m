From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 13:55:47 +0200
Subject: [Buildroot] [git commit branch/next] sqlite: bump version to 3.13.0
Message-ID: <20160523115739.BFDE581938@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd540fb983367f5c653c4f4894df26380eafaf25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index a005cb1..ce03e1e 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1 b43c2e7238e54c50b95fbbd85c48792f4f39af8c  sqlite-autoconf-3120200.tar.gz
+sha1 f6f76e310389e3f510b23826f805850449ae8653  sqlite-autoconf-3130000.tar.gz
 # Calculated based on the hash above
-sha256 fd00770c9afd39db555c78400e52f55e8bd6568c78be23561abb472a22d09abb  sqlite-autoconf-3120200.tar.gz
+sha256 e2797026b3310c9d08bd472f6d430058c6dd139ff9d4e30289884ccd9744086b  sqlite-autoconf-3130000.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 2f9b6ce..0dadd76 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3120200
+SQLITE_VERSION = 3130000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2016
 SQLITE_LICENSE = Public domain
