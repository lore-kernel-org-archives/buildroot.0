From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 28 Sep 2006 07:26:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dm
Message-ID: <20060928142633.2A66D485B7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-09-28 07:26:32 -0700 (Thu, 28 Sep 2006)
New Revision: 16249

Log:
- bump version


Modified:
   trunk/buildroot/package/dm/dm.mk


Changeset:
Modified: trunk/buildroot/package/dm/dm.mk
===================================================================
--- trunk/buildroot/package/dm/dm.mk	2006-09-28 12:51:25 UTC (rev 16248)
+++ trunk/buildroot/package/dm/dm.mk	2006-09-28 14:26:32 UTC (rev 16249)
@@ -24,7 +24,7 @@
 # USA
 
 DM_BASEVER=1.02
-DM_PATCH=09
+DM_PATCH=10
 DM_VERSION=$(DM_BASEVER).$(DM_PATCH)
 DM_SOURCE:=device-mapper.$(DM_VERSION).tgz
 DM_SITE:=ftp://sources.redhat.com/pub/dm
