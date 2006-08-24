From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 24 Aug 2006 14:46:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dm
Message-ID: <20060824214657.EC75548AA1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-08-24 14:46:57 -0700 (Thu, 24 Aug 2006)
New Revision: 15987

Log:
- update to 1.02.09


Modified:
   trunk/buildroot/package/dm/dm.mk


Changeset:
Modified: trunk/buildroot/package/dm/dm.mk
===================================================================
--- trunk/buildroot/package/dm/dm.mk	2006-08-24 21:39:49 UTC (rev 15986)
+++ trunk/buildroot/package/dm/dm.mk	2006-08-24 21:46:57 UTC (rev 15987)
@@ -1,6 +1,6 @@
 #############################################################
 #
-# dm
+# device-mapper
 #
 #############################################################
 # Copyright (C) 2005 by Richard Downer <rdowner@gmail.com>
@@ -24,7 +24,7 @@
 # USA
 
 DM_BASEVER=1.02
-DM_PATCH=08
+DM_PATCH=09
 DM_VERSION=$(DM_BASEVER).$(DM_PATCH)
 DM_SOURCE:=device-mapper.$(DM_VERSION).tgz
 DM_SITE:=ftp://sources.redhat.com/pub/dm
