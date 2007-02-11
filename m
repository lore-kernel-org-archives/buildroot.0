From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 11 Feb 2007 10:08:25 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lighttpd
Message-ID: <20070211180825.4A3A248618@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-11 10:08:24 -0800 (Sun, 11 Feb 2007)
New Revision: 17855

Log:
- bump version. Closes #1206


Modified:
   trunk/buildroot/package/lighttpd/lighttpd.mk


Changeset:
Modified: trunk/buildroot/package/lighttpd/lighttpd.mk
===================================================================
--- trunk/buildroot/package/lighttpd/lighttpd.mk	2007-02-11 16:19:28 UTC (rev 17854)
+++ trunk/buildroot/package/lighttpd/lighttpd.mk	2007-02-11 18:08:24 UTC (rev 17855)
@@ -3,7 +3,7 @@
 # lighttpd
 #
 #############################################################
-LIGHTTPD_VER:=1.4.3
+LIGHTTPD_VER:=1.4.13
 LIGHTTPD_SOURCE:=lighttpd-$(LIGHTTPD_VER).tar.gz
 LIGHTTPD_SITE:=http://www.lighttpd.net/download
 LIGHTTPD_DIR:=$(BUILD_DIR)/lighttpd-$(LIGHTTPD_VER)
