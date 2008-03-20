From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu, 20 Mar 2008 09:55:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xstroke
Message-ID: <20080320165558.375B73C31A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-20 09:55:57 -0700 (Thu, 20 Mar 2008)
New Revision: 21417

Log:
add docker dependency to xstroke

Modified:
   trunk/buildroot/package/xstroke/xstroke.mk


Changeset:
Modified: trunk/buildroot/package/xstroke/xstroke.mk
===================================================================
--- trunk/buildroot/package/xstroke/xstroke.mk	2008-03-20 16:55:37 UTC (rev 21416)
+++ trunk/buildroot/package/xstroke/xstroke.mk	2008-03-20 16:55:57 UTC (rev 21417)
@@ -11,7 +11,7 @@
 XSTROKE_INSTALL_TARGET = YES
 XSTROKE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-XSTROKE_DEPENDENCIES = uclibc 
+XSTROKE_DEPENDENCIES = uclibc docker
 
 $(eval $(call AUTOTARGETS,package,xstroke))
 
