From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed,  6 Jun 2007 11:10:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fakeroot
Message-ID: <20070606181014.01D8248090@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-06 11:10:14 -0700 (Wed, 06 Jun 2007)
New Revision: 18755

Log:
- bump version


Modified:
   trunk/buildroot/package/fakeroot/fakeroot.mk


Changeset:
Modified: trunk/buildroot/package/fakeroot/fakeroot.mk
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot.mk	2007-06-06 17:49:03 UTC (rev 18754)
+++ trunk/buildroot/package/fakeroot/fakeroot.mk	2007-06-06 18:10:14 UTC (rev 18755)
@@ -3,7 +3,7 @@
 # fakeroot
 #
 #############################################################
-FAKEROOT_VERSION:=1.6.5
+FAKEROOT_VERSION:=1.7.1
 FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
 FAKEROOT_SITE:=http://ftp.debian.org/debian/pool/main/f/fakeroot
 FAKEROOT_CAT:=$(ZCAT)
