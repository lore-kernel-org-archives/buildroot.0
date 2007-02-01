From: andersen at uclibc.org <andersen@uclibc.org>
Date: Thu,  1 Feb 2007 11:20:00 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
Message-ID: <20070201192000.2FE5048590@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-02-01 11:19:59 -0800 (Thu, 01 Feb 2007)
New Revision: 17698

Log:
bump version


Modified:
   trunk/buildroot/package/libgtk2/libgtk2.mk


Changeset:
Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2007-02-01 12:30:34 UTC (rev 17697)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2007-02-01 19:19:59 UTC (rev 17698)
@@ -3,7 +3,7 @@
 # libgtk2.0
 #
 #############################################################
-LIBGTK2_VERSION:=2.10.7
+LIBGTK2_VERSION:=2.10.9
 LIBGTK2_SOURCE:=gtk+-$(LIBGTK2_VERSION).tar.bz2
 LIBGTK2_SITE:=ftp://ftp.gtk.org/pub/gtk/v2.10
 LIBGTK2_CAT:=$(BZCAT)
