From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Aug 2007 09:57:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pptp-linux
Message-ID: <20070822165732.9FE25A5D3C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-22 09:57:32 -0700 (Wed, 22 Aug 2007)
New Revision: 19658

Log:
- set _SKIP_CONFIGURE since we can just make it


Modified:
   trunk/buildroot/package/pptp-linux/pptp-linux.mk


Changeset:
Modified: trunk/buildroot/package/pptp-linux/pptp-linux.mk
===================================================================
--- trunk/buildroot/package/pptp-linux/pptp-linux.mk	2007-08-22 16:56:36 UTC (rev 19657)
+++ trunk/buildroot/package/pptp-linux/pptp-linux.mk	2007-08-22 16:57:32 UTC (rev 19658)
@@ -7,6 +7,7 @@
 PPTP_LINUX_VERSION=1.7.0
 PPTP_LINUX_SOURCE=pptp-linux_$(PPTP_LINUX_VERSION).orig.tar.gz
 PPTP_LINUX_PATCH=pptp-linux_$(PPTP_LINUX_VERSION)-2.diff.gz
-PPTP_LINUX_SITE=http://ftp.debian.org/debian/pool/main/p/pptp-linux/
+PPTP_LINUX_SITE=http://ftp.debian.org/debian/pool/main/p/pptp-linux
+PPTP_LINUX_SKIP_CONFIGURE=true
 
 $(eval $(call AUTOTARGETS,pptp-linux))
