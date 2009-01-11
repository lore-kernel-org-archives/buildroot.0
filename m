From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 11 Jan 2009 20:08:47 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/php
Message-ID: <20090111200848.0785076736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-11 20:08:47 +0000 (Sun, 11 Jan 2009)
New Revision: 24753

Log:
Bump php version since source is removed due to security risk

Modified:
   trunk/buildroot/package/php/php.mk


Changeset:
Modified: trunk/buildroot/package/php/php.mk
===================================================================
--- trunk/buildroot/package/php/php.mk	2009-01-11 19:58:51 UTC (rev 24752)
+++ trunk/buildroot/package/php/php.mk	2009-01-11 20:08:47 UTC (rev 24753)
@@ -3,7 +3,7 @@
 # php
 #
 #############################################################
-PHP_VER:=5.2.7
+PHP_VER:=5.2.8
 PHP_SOURCE:=php-$(PHP_VER).tar.bz2
 PHP_SITE:=http://us.php.net/get/${PHP_SOURCE}/from/us2.php.net/mirror
 PHP_DIR:=$(BUILD_DIR)/php-$(PHP_VER)
