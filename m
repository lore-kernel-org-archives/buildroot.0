From: tpetazzoni at uclibc.org <tpetazzoni@uclibc.org>
Date: Sat, 13 Dec 2008 03:01:21 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/php
Message-ID: <20081213110121.B58563C678@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: tpetazzoni
Date: 2008-12-13 03:01:21 -0800 (Sat, 13 Dec 2008)
New Revision: 24402

Log:
Bump PHP version to 5.2.7.

Patch provided by Gustavo Zacarias <gustavo@zacarias.com.ar>.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>



Modified:
   trunk/buildroot/package/php/php.mk


Changeset:
Modified: trunk/buildroot/package/php/php.mk
===================================================================
--- trunk/buildroot/package/php/php.mk	2008-12-13 10:55:48 UTC (rev 24401)
+++ trunk/buildroot/package/php/php.mk	2008-12-13 11:01:21 UTC (rev 24402)
@@ -3,7 +3,7 @@
 # php
 #
 #############################################################
-PHP_VER:=5.2.6
+PHP_VER:=5.2.7
 PHP_SOURCE:=php-$(PHP_VER).tar.bz2
 PHP_SITE:=http://us.php.net/get/${PHP_SOURCE}/from/us2.php.net/mirror
 PHP_DIR:=$(BUILD_DIR)/php-$(PHP_VER)
