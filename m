From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun,  3 Feb 2019 13:47:52 +0100
Subject: [Buildroot] [PATCH] ncdu: bump to version 1.13
Message-ID: <1549198072-2967-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also added license hash

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/ncdu/ncdu.hash | 9 ++++++---
 package/ncdu/ncdu.mk   | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/ncdu/ncdu.hash b/package/ncdu/ncdu.hash
index 8a0c1d1..213232e 100644
--- a/package/ncdu/ncdu.hash
+++ b/package/ncdu/ncdu.hash
@@ -1,3 +1,6 @@
-# From http://dev.yorhel.nl/download/ncdu-1.12.tar.gz.{md5,sha1}
-md5 7365ac46c420bc511621216b1747984f  ncdu-1.12.tar.gz
-sha1 b79b1c44784f334dca74d89a49f49274f14cfeef  ncdu-1.12.tar.gz
+# From http://dev.yorhel.nl/download/ncdu-1.13.tar.gz.{md5,sha1}
+md5 67239592ac41f42290f52ab89ff198be  ncdu-1.13.tar.gz
+sha1 3233c4185208d9989ac528a94817ed92dd59c773  ncdu-1.13.tar.gz
+
+# computed locally
+md5 6682a63e3e3e8ea14051d05056a857a0 COPYING
diff --git a/package/ncdu/ncdu.mk b/package/ncdu/ncdu.mk
index d45e62d..9a7170d 100644
--- a/package/ncdu/ncdu.mk
+++ b/package/ncdu/ncdu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NCDU_VERSION = 1.12
+NCDU_VERSION = 1.13
 NCDU_SITE = http://dev.yorhel.nl/download
 
 NCDU_DEPENDENCIES = ncurses
-- 
2.7.4
