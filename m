From: andersen at uclibc.org <andersen@uclibc.org>
Date: Mon,  9 Oct 2006 14:09:20 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libglib12
Message-ID: <20061009210920.4445F485AC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-10-09 14:09:20 -0700 (Mon, 09 Oct 2006)
New Revision: 16352

Log:
use cannonical source location


Modified:
   trunk/buildroot/package/libglib12/libglib12.mk


Changeset:
Modified: trunk/buildroot/package/libglib12/libglib12.mk
===================================================================
--- trunk/buildroot/package/libglib12/libglib12.mk	2006-10-09 21:08:56 UTC (rev 16351)
+++ trunk/buildroot/package/libglib12/libglib12.mk	2006-10-09 21:09:20 UTC (rev 16352)
@@ -4,7 +4,7 @@
 #
 #############################################################
 LIBGLIB12_SOURCE:=glib-1.2.10.tar.gz
-LIBGLIB12_SITE:=http://ftp.gnome.org/pub/gnome/sources/glib/1.2
+LIBGLIB12_SITE:=http://ftp.gtk.org/pub/gtk/v1.2
 LIBGLIB12_CAT:=$(ZCAT)
 LIBGLIB12_DIR:=$(BUILD_DIR)/glib-1.2.10
 LIBGLIB12_BINARY:=libglib.a
