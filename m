From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 20 Sep 2007 11:28:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070920182854.175B9A685D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-20 11:28:53 -0700 (Thu, 20 Sep 2007)
New Revision: 19921

Log:
- revert r19918 for now


Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-09-20 17:47:30 UTC (rev 19920)
+++ trunk/buildroot/package/Makefile.in	2007-09-20 18:28:53 UTC (rev 19921)
@@ -136,7 +136,6 @@
 		GCC="$(TARGET_CROSS)gcc $(TARGET_CFLAGS)" \
 		CXX="$(TARGET_CROSS)g++ $(TARGET_CFLAGS)" \
 		CPP="$(TARGET_CROSS)cpp $(TARGET_CFLAGS)" \
-		CFLAGS="" CXXFLAGS="" FFLAGS="" \
 		RANLIB=$(TARGET_CROSS)ranlib \
 		STRIP=$(TARGET_CROSS)strip \
 		OBJCOPY=$(TARGET_CROSS)objcopy \
