From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue,  2 Oct 2007 04:06:44 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fakeroot
Message-ID: <20071002110644.0A44FA60CE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-10-02 04:06:43 -0700 (Tue, 02 Oct 2007)
New Revision: 20171

Log:
- bump version


Modified:
   trunk/buildroot/package/fakeroot/fakeroot.mk


Changeset:
Modified: trunk/buildroot/package/fakeroot/fakeroot.mk
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot.mk	2007-10-02 10:17:56 UTC (rev 20170)
+++ trunk/buildroot/package/fakeroot/fakeroot.mk	2007-10-02 11:06:43 UTC (rev 20171)
@@ -3,7 +3,7 @@
 # fakeroot
 #
 #############################################################
-FAKEROOT_VERSION:=1.7.1
+FAKEROOT_VERSION:=1.8
 FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
 FAKEROOT_SITE:=http://ftp.debian.org/debian/pool/main/f/fakeroot
 FAKEROOT_CAT:=$(ZCAT)
