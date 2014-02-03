From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Feb 2014 09:23:37 +0100
Subject: [Buildroot] [git commit] mysql: bump to version 5.1.73
Message-ID: <20140203083859.891329C754@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=42c56751fc554503a03d4a914ce2e814eeaf5a41
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcelo Guti??rrez <kuyurix@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mysql/mysql.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
