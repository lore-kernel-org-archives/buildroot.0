From: thomasez at uclibc.org <thomasez@uclibc.org>
Date: Mon, 21 Jan 2008 03:07:58 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fakeroot
Message-ID: <20080121110758.AA14D12C5D9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: thomasez
Date: 2008-01-21 03:07:57 -0800 (Mon, 21 Jan 2008)
New Revision: 20882

Log:
Upped version, fixing http://busybox.net/bugs/view.php?id=1954


Modified:
   trunk/buildroot/package/fakeroot/fakeroot.mk


Changeset:
Modified: trunk/buildroot/package/fakeroot/fakeroot.mk
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot.mk	2008-01-21 09:42:25 UTC (rev 20881)
+++ trunk/buildroot/package/fakeroot/fakeroot.mk	2008-01-21 11:07:57 UTC (rev 20882)
@@ -3,7 +3,7 @@
 # fakeroot
 #
 #############################################################
-FAKEROOT_VERSION:=1.8.10
+FAKEROOT_VERSION:=1.9
 FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
 FAKEROOT_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/f/fakeroot
 FAKEROOT_CAT:=$(ZCAT)
