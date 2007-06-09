From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  9 Jun 2007 02:58:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/file
Message-ID: <20070609095816.06D7C48021@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-09 02:58:14 -0700 (Sat, 09 Jun 2007)
New Revision: 18788

Log:
- bump version


Modified:
   trunk/buildroot/package/file/file.mk


Changeset:
Modified: trunk/buildroot/package/file/file.mk
===================================================================
--- trunk/buildroot/package/file/file.mk	2007-06-09 09:12:45 UTC (rev 18787)
+++ trunk/buildroot/package/file/file.mk	2007-06-09 09:58:14 UTC (rev 18788)
@@ -3,7 +3,7 @@
 # file
 #
 #############################################################
-FILE_VER:=4.19
+FILE_VER:=4.21
 FILE_SOURCE:=file-$(FILE_VER).tar.gz
 FILE_SITE:=ftp://ftp.astron.com/pub/file
 FILE_SOURCE_DIR:=$(BUILD_DIR)/file-$(FILE_VER)
