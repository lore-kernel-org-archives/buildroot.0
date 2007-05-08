From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue,  8 May 2007 08:19:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dash
Message-ID: <20070508151914.3FE104801F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-05-08 08:19:13 -0700 (Tue, 08 May 2007)
New Revision: 18583

Log:
- bump version. Closes #1340


Modified:
   trunk/buildroot/package/dash/dash.mk


Changeset:
Modified: trunk/buildroot/package/dash/dash.mk
===================================================================
--- trunk/buildroot/package/dash/dash.mk	2007-05-08 15:17:41 UTC (rev 18582)
+++ trunk/buildroot/package/dash/dash.mk	2007-05-08 15:19:13 UTC (rev 18583)
@@ -8,7 +8,7 @@
 DASH_SITE:=http://ftp.debian.org/debian/pool/main/d/dash
 DASH_CAT:=$(ZCAT)
 DASH_DIR:=$(BUILD_DIR)/dash-$(DASH_VER)
-DASH_PATCH1:=dash_$(DASH_VER)-6.diff.gz
+DASH_PATCH1:=dash_$(DASH_VER)-7.diff.gz
 DASH_BINARY:=src/dash
 DASH_TARGET_BINARY:=bin/dash
 
