From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 15 Dec 2006 06:05:52 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/iostat
Message-ID: <20061215140552.D7C2D4858F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-15 06:05:51 -0800 (Fri, 15 Dec 2006)
New Revision: 16943

Log:
- Update URL. Thanks to Ulrich Hecht.


Modified:
   trunk/buildroot/package/iostat/iostat.mk


Changeset:
Modified: trunk/buildroot/package/iostat/iostat.mk
===================================================================
--- trunk/buildroot/package/iostat/iostat.mk	2006-12-15 13:57:07 UTC (rev 16942)
+++ trunk/buildroot/package/iostat/iostat.mk	2006-12-15 14:05:51 UTC (rev 16943)
@@ -5,7 +5,7 @@
 #############################################################
 IOSTAT_VER:=2.2
 IOSTAT_SOURCE:=iostat-$(IOSTAT_VER).tar.gz
-IOSTAT_SITE:=http://linux.inet.hr
+IOSTAT_SITE:=http://linux.inet.hr/files
 IOSTAT_DIR:=$(BUILD_DIR)/iostat-$(IOSTAT_VER)
 IOSTAT_BINARY:=iostat
 IOSTAT_TARGET_BINARY:=usr/bin/iostat
