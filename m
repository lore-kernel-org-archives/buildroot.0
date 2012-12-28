From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Dec 2012 10:05:54 -0300
Subject: [Buildroot] [PATCH 1/2] mysql_client: bump to version 5.1.67
Message-ID: <1356699955-27479-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mysql_client/mysql_client.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mysql_client/mysql_client.mk b/package/mysql_client/mysql_client.mk
index 9785aee..1477b66 100644
--- a/package/mysql_client/mysql_client.mk
+++ b/package/mysql_client/mysql_client.mk
@@ -4,12 +4,14 @@
 #
 #############################################################
 
-MYSQL_CLIENT_VERSION = 5.1.66
+MYSQL_CLIENT_VERSION = 5.1.67
 MYSQL_CLIENT_SOURCE = mysql-$(MYSQL_CLIENT_VERSION).tar.gz
 MYSQL_CLIENT_SITE = http://downloads.skysql.com/archives/mysql-5.1
 MYSQL_CLIENT_INSTALL_STAGING = YES
 MYSQL_CLIENT_DEPENDENCIES = readline ncurses
-MYSQL_CLIENT_AUTORECONF=YES
+MYSQL_CLIENT_AUTORECONF = YES
+MYSQL_CLIENT_LICENSE = GPLv2
+MYSQL_CLIENT_LICENSE_FILES = README COPYING
 
 MYSQL_CLIENT_CONF_ENV = \
 	ac_cv_sys_restartable_syscalls=yes \
-- 
1.7.8.6
