From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Dec 2012 16:54:35 +0100
Subject: [Buildroot] [git commit] mysql_client: bump to version 5.1.67
Message-ID: <20121228155607.097F49A4DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=14c0544003cff4d00e638e6b13a884bc61e56a9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
