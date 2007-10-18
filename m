From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Thu, 18 Oct 2007 14:49:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fakeroot
Message-ID: <20071018214936.1E632A45CB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-10-18 14:49:35 -0700 (Thu, 18 Oct 2007)
New Revision: 20290

Log:
update fakeroot to 1.8.2 version

Modified:
   trunk/buildroot/package/fakeroot/fakeroot.mk


Changeset:
Modified: trunk/buildroot/package/fakeroot/fakeroot.mk
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot.mk	2007-10-18 13:01:22 UTC (rev 20289)
+++ trunk/buildroot/package/fakeroot/fakeroot.mk	2007-10-18 21:49:35 UTC (rev 20290)
@@ -3,7 +3,7 @@
 # fakeroot
 #
 #############################################################
-FAKEROOT_VERSION:=1.8.1
+FAKEROOT_VERSION:=1.8.2
 FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
 FAKEROOT_SITE:=http://ftp.debian.org/debian/pool/main/f/fakeroot
 FAKEROOT_CAT:=$(ZCAT)
