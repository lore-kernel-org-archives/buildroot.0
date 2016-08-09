From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 9 Aug 2016 10:07:38 +0100
Subject: [Buildroot] [PATCH 2/2] sqlite: bump version to 3.14.0
In-Reply-To: <1470733658-55267-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1470733658-55267-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1470733658-55267-2-git-send-email-Vincent.Riera@imgtec.com>
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
index ce03e1e..b4db80d 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1 f6f76e310389e3f510b23826f805850449ae8653  sqlite-autoconf-3130000.tar.gz
+sha1 f0ed10b416c467062c76b899f08c773c713fb8fd  sqlite-autoconf-3140000.tar.gz
 # Calculated based on the hash above
-sha256 e2797026b3310c9d08bd472f6d430058c6dd139ff9d4e30289884ccd9744086b  sqlite-autoconf-3130000.tar.gz
+sha256 742db0ebbd9cc91ed6a41857f50aa9795fc859c994a256125135cd07f6cdfd76  sqlite-autoconf-3140000.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 0dadd76..9703f82 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3130000
+SQLITE_VERSION = 3140000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2016
 SQLITE_LICENSE = Public domain
-- 
2.7.3
