From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 19 Sep 2007 07:02:55 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lighttpd
Message-ID: <20070919140255.CF24B3004D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-19 07:02:53 -0700 (Wed, 19 Sep 2007)
New Revision: 19891

Log:
- bump version. Closes #1502


Modified:
   trunk/buildroot/package/lighttpd/lighttpd.mk


Changeset:
Modified: trunk/buildroot/package/lighttpd/lighttpd.mk
===================================================================
--- trunk/buildroot/package/lighttpd/lighttpd.mk	2007-09-19 12:28:48 UTC (rev 19890)
+++ trunk/buildroot/package/lighttpd/lighttpd.mk	2007-09-19 14:02:53 UTC (rev 19891)
@@ -3,7 +3,7 @@
 # lighttpd
 #
 #############################################################
-LIGHTTPD_VERSION:=1.4.16
+LIGHTTPD_VERSION:=1.4.18
 LIGHTTPD_SOURCE:=lighttpd_$(LIGHTTPD_VERSION).orig.tar.gz
 LIGHTTPD_PATCH:=lighttpd_$(LIGHTTPD_VERSION)-1.diff.gz
 LIGHTTPD_SITE:=http://ftp.debian.org/debian/pool/main/l/lighttpd
