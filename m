From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu, 24 Apr 2008 07:25:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xstroke
Message-ID: <20080424142510.149043C8D5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-24 07:25:09 -0700 (Thu, 24 Apr 2008)
New Revision: 21843

Log:
remove trailing space

Modified:
   trunk/buildroot/package/xstroke/xstroke.mk


Changeset:
Modified: trunk/buildroot/package/xstroke/xstroke.mk
===================================================================
--- trunk/buildroot/package/xstroke/xstroke.mk	2008-04-24 14:24:02 UTC (rev 21842)
+++ trunk/buildroot/package/xstroke/xstroke.mk	2008-04-24 14:25:09 UTC (rev 21843)
@@ -11,7 +11,7 @@
 XSTROKE_INSTALL_TARGET = YES
 XSTROKE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-XSTROKE_DEPENDENCIES = uclibc 
+XSTROKE_DEPENDENCIES = uclibc
 
 $(eval $(call AUTOTARGETS,package,xstroke))
 
