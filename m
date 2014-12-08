From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  8 Dec 2014 08:10:01 -0300
Subject: [Buildroot] [PATCH] sqlite: bump to version 3.8.7.3
Message-ID: <1418037001-10153-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 26516c9..31906b9 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,2 +1,2 @@
 # From http://www.sqlite.org/download.html
-sha1  175283383d010709f76fdd13cb0c8c3c329a1c67  sqlite-autoconf-3080702.tar.gz
+sha1	5cbe9aa4af1b32787045a251dba6debee3f061c0	sqlite-autoconf-3080703.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index aba788e..7513c33 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3080702
+SQLITE_VERSION = 3080703
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2014
 SQLITE_LICENSE = Public domain
-- 
2.0.4
