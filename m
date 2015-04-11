From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 11 Apr 2015 19:09:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.8.9
Message-ID: <1428772194-23261-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sqlite/sqlite.hash |    2 +-
 package/sqlite/sqlite.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 3dfbd5c..b57fdfb 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,2 +1,2 @@
 # From http://www.sqlite.org/download.html
-sha1	2fe3f6226a2a08a2e814b97cd53e36bb3c597112	sqlite-autoconf-3080803.tar.gz
+sha1	db70dee268700b312cbaa5b3e5cf8454e1c8b7b9	sqlite-autoconf-3080900.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index badd378..d8ea1c7 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3080803
+SQLITE_VERSION = 3080900
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2015
 SQLITE_LICENSE = Public domain
-- 
1.7.10.4
