From: correa at uclibc.org <correa@uclibc.org>
Date: Mon, 13 Apr 2009 18:58:36 +0000 (UTC)
Subject: [Buildroot] svn commit: [26086] trunk/buildroot/package/qtopia4
Message-ID: <20090413185836.62F6B76475@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2009-04-13 18:58:35 +0000 (Mon, 13 Apr 2009)
New Revision: 26086

Log:
Qtopia4: -xmlpatterns requires -exceptions .

Modified:
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2009-04-13 14:23:12 UTC (rev 26085)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2009-04-13 18:58:35 UTC (rev 26086)
@@ -293,7 +293,7 @@
 endif
 
 ifeq ($(BR2_PACKAGE_QTOPIA4_XMLPATTERNS),y)
-QTOPIA4_CONFIGURE+= -xmlpatterns
+QTOPIA4_CONFIGURE+= -xmlpatterns -exceptions
 else
 QTOPIA4_CONFIGURE+= -no-xmlpatterns
 endif
