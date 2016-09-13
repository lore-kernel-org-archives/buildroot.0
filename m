From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 13 Sep 2016 13:45:13 +0100
Subject: [Buildroot] [PATCH] sqlite: bump version to 3140200 (3.14.2)
Message-ID: <1473770713-31946-1-git-send-email-Vincent.Riera@imgtec.com>
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
index b4db80d..308522b 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1 f0ed10b416c467062c76b899f08c773c713fb8fd  sqlite-autoconf-3140000.tar.gz
+sha1 5d3a6bccd9154963641960db61df901a4e0b3ca0  sqlite-autoconf-3140200.tar.gz
 # Calculated based on the hash above
-sha256 742db0ebbd9cc91ed6a41857f50aa9795fc859c994a256125135cd07f6cdfd76  sqlite-autoconf-3140000.tar.gz
+sha256 644f0c127f7d0cbe8765b9bbdf9ed09d6a2f2b9dfba48ddfd8ca0a42fdb5b3fc  sqlite-autoconf-3140200.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 9703f82..a8a36bb 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3140000
+SQLITE_VERSION = 3140200
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2016
 SQLITE_LICENSE = Public domain
-- 
2.7.3
