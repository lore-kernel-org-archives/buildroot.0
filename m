From: vapier@uclibc.org <vapier@uclibc.org>
Date: Wed Jul 19 16:54:00 2006
Subject: [Buildroot] svn commit: trunk/buildroot/package/dm
Message-ID: <20060719235400.2BDEA48B24@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vapier
Date: 2006-07-19 16:53:59 -0700 (Wed, 19 Jul 2006)
New Revision: 15730

Log:
ver bump #962 by bowerymarc

Modified:
   trunk/buildroot/package/dm/dm.mk


Changeset:
Modified: trunk/buildroot/package/dm/dm.mk
===================================================================
--- trunk/buildroot/package/dm/dm.mk	2006-07-19 21:45:30 UTC (rev 15729)
+++ trunk/buildroot/package/dm/dm.mk	2006-07-19 23:53:59 UTC (rev 15730)
@@ -24,7 +24,7 @@
 # USA
 
 DM_BASEVER=1.02
-DM_PATCH=07
+DM_PATCH=08
 DM_VERSION=$(DM_BASEVER).$(DM_PATCH)
 DM_SOURCE:=device-mapper.$(DM_VERSION).tgz
 DM_SITE:=ftp://sources.redhat.com/pub/dm
