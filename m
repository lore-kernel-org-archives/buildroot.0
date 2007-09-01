From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  1 Sep 2007 05:21:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pptp-linux
Message-ID: <20070901122107.00D6EA4622@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-01 05:21:07 -0700 (Sat, 01 Sep 2007)
New Revision: 19744

Log:
- use http and fix a typo in the URL


Modified:
   trunk/buildroot/package/pptp-linux/pptp-linux.mk


Changeset:
Modified: trunk/buildroot/package/pptp-linux/pptp-linux.mk
===================================================================
--- trunk/buildroot/package/pptp-linux/pptp-linux.mk	2007-09-01 10:54:50 UTC (rev 19743)
+++ trunk/buildroot/package/pptp-linux/pptp-linux.mk	2007-09-01 12:21:07 UTC (rev 19744)
@@ -6,7 +6,7 @@
 PPTP_LINUX_VERSION:=1.7.0
 PPTP_LINUX_SOURCE:=pptp-linux_$(PPTP_LINUX_VERSION).orig.tar.gz
 #PPTP_LINUX_PATCH:=pptp-linux_$(PPTP_LINUX_VERSION)-2.diff.gz
-PPTP_LINUX_SITE:=ftp://ftp.debian.org/debian/pool/main/a/pptp-linux
+PPTP_LINUX_SITE:=http://ftp.debian.org/debian/pool/main/p/pptp-linux
 PPTP_LINUX_DIR:=$(BUILD_DIR)/pptp-linux-$(PPTP_LINUX_VERSION).orig
 PPTP_LINUX_CAT:=$(ZCAT)
 PPTP_LINUX_BINARY:=pptp
