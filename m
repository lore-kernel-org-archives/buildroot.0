From: andersen at uclibc.org <andersen@uclibc.org>
Date: Tue,  9 Dec 2008 12:00:32 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dm
Message-ID: <20081209200032.0ECDB3C683@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2008-12-09 12:00:31 -0800 (Tue, 09 Dec 2008)
New Revision: 24347

Log:
bump


Modified:
   trunk/buildroot/package/dm/dm.mk


Changeset:
Modified: trunk/buildroot/package/dm/dm.mk
===================================================================
--- trunk/buildroot/package/dm/dm.mk	2008-12-09 13:23:59 UTC (rev 24346)
+++ trunk/buildroot/package/dm/dm.mk	2008-12-09 20:00:31 UTC (rev 24347)
@@ -24,7 +24,7 @@
 # USA
 
 DM_BASEVER=1.02
-DM_PATCH=22
+DM_PATCH=28
 DM_VERSION=$(DM_BASEVER).$(DM_PATCH)
 DM_SOURCE:=device-mapper.$(DM_VERSION).tgz
 DM_SITE:=ftp://sources.redhat.com/pub/dm
