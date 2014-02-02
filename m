From: =?UTF-8?q?Marcelo=20Guti=C3=A9rrez?= <kuyurix@gmail.com>
Date: Sun,  2 Feb 2014 20:52:09 +0000
Subject: [Buildroot] [PATCH 1/1] mysql: bump to version 5.1.73
Message-ID: <1391374329-2675-1-git-send-email-kuyurix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Marcelo Guti?rrez <kuyurix@gmail.com>
---
 package/mysql/mysql.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index aaf6ba9..9b22c2d 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MYSQL_VERSION_MAJOR = 5.1
-MYSQL_VERSION = $(MYSQL_VERSION_MAJOR).70
+MYSQL_VERSION = $(MYSQL_VERSION_MAJOR).73
 MYSQL_SOURCE = mysql-$(MYSQL_VERSION).tar.gz
 MYSQL_SITE = http://downloads.skysql.com/archives/mysql-$(MYSQL_VERSION_MAJOR)
 MYSQL_INSTALL_STAGING = YES
-- 
1.7.10.4
