From: Alexander Dahl <post@lespocky.de>
Date: Thu,  4 Aug 2016 12:47:42 +0200
Subject: [Buildroot] [PATCH] ncdu: bump version from 1.9 to 1.11
Message-ID: <1470307662-1879-1-git-send-email-post@lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Dahl <post@lespocky.de>
---
 package/ncdu/ncdu.hash | 6 +++---
 package/ncdu/ncdu.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ncdu/ncdu.hash b/package/ncdu/ncdu.hash
index 7985c99..4bdda40 100644
--- a/package/ncdu/ncdu.hash
+++ b/package/ncdu/ncdu.hash
@@ -1,3 +1,3 @@
-# From http://dev.yorhel.nl/download/ncdu-1.9.tar.gz.{md5,sha1}
-md5	93258079db897d28bb8890e2db89b1fb	ncdu-1.9.tar.gz
-sha1	27cb5464b192db8ffdf0a894fe51d29985348eb0	ncdu-1.9.tar.gz
+# From http://dev.yorhel.nl/download/ncdu-1.11.tar.gz.{md5,sha1}
+md5   9e44240a5356b029f05f0e70a63c4d12          ncdu-1.11.tar.gz
+sha1  8f22d713e6d2b28e1f501eee2bd1e03b55550c8d  ncdu-1.11.tar.gz
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
index 0351970..bccbb8d 100644
--- a/package/ncdu/ncdu.mk
+++ b/package/ncdu/ncdu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NCDU_VERSION = 1.9
+NCDU_VERSION = 1.11
 NCDU_SITE = http://dev.yorhel.nl/download
 
 NCDU_DEPENDENCIES = ncurses
-- 
2.1.4
