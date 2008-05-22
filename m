From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 22 May 2008 14:30:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
Message-ID: <20080522213047.C6BA13C586@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-05-22 14:30:44 -0700 (Thu, 22 May 2008)
New Revision: 22053

Log:
Add end-of-line at last line of freetype.mk

Modified:
   trunk/buildroot/package/freetype/freetype.mk


Changeset:
Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2008-05-22 17:49:58 UTC (rev 22052)
+++ trunk/buildroot/package/freetype/freetype.mk	2008-05-22 21:30:44 UTC (rev 22053)
@@ -61,4 +61,4 @@
 #############################################################
 ifeq ($(strip $(BR2_PACKAGE_FREETYPE)),y)
 TARGETS+=freetype
-endif
\ No newline at end of file
+endif
