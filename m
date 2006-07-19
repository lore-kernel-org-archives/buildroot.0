From: vapier@uclibc.org <vapier@uclibc.org>
Date: Wed Jul 19 17:06:53 2006
Subject: [Buildroot] svn commit: trunk/buildroot/package/gettext
Message-ID: <20060720000652.B718448C21@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vapier
Date: 2006-07-19 17:06:52 -0700 (Wed, 19 Jul 2006)
New Revision: 15732

Log:
ver bump to 0.14.6

Modified:
   trunk/buildroot/package/gettext/gettext.mk


Changeset:
Modified: trunk/buildroot/package/gettext/gettext.mk
===================================================================
--- trunk/buildroot/package/gettext/gettext.mk	2006-07-19 23:56:33 UTC (rev 15731)
+++ trunk/buildroot/package/gettext/gettext.mk	2006-07-20 00:06:52 UTC (rev 15732)
@@ -3,9 +3,10 @@
 # gettext
 #
 #############################################################
-GETTEXT_SOURCE:=gettext-0.14.5.tar.gz
+GETTEXT_VER:=0.14.6
+GETTEXT_SOURCE:=gettext-$(GETTEXT_VER).tar.gz
 GETTEXT_SITE:=http://ftp.gnu.org/pub/gnu/gettext
-GETTEXT_DIR:=$(BUILD_DIR)/gettext-0.14.5
+GETTEXT_DIR:=$(BUILD_DIR)/gettext-$(GETTEXT_VER)
 GETTEXT_CAT:=zcat
 GETTEXT_BINARY:=src/gettext
 GETTEXT_TARGET_BINARY:=usr/bin/gettext
