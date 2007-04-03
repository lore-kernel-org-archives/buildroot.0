From: Benedict, Michael <MBenedict@twacs.com>
Date: Tue, 3 Apr 2007 13:09:11 -0500
Subject: [Buildroot] svn commit: trunk/buildroot/package/fakeroot
In-Reply-To: <20070403153604.26FBA4807E@busybox.net>
References: <20070403153604.26FBA4807E@busybox.net>
Message-ID: <CF7E46FCFF66AD478BB72724345289EC2795A3@twx-exch01.twacs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks!  As an added bonus, you can close bug #0001292 (found it after I
posted to the list).
	-Michael 

-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org]
On Behalf Of jacmet at uclibc.org
Sent: Tuesday, April 03, 2007 10:36 AM
To: buildroot at uclibc.org
Subject: [Buildroot] svn commit: trunk/buildroot/package/fakeroot

Author: jacmet
Date: 2007-04-03 08:36:03 -0700 (Tue, 03 Apr 2007) New Revision: 18314

Log:
Version bump. Thanks to Michael Benedict

Modified:
   trunk/buildroot/package/fakeroot/fakeroot.mk


Changeset:
Modified: trunk/buildroot/package/fakeroot/fakeroot.mk
===================================================================
--- trunk/buildroot/package/fakeroot/fakeroot.mk	2007-04-03
15:35:26 UTC (rev 18313)
+++ trunk/buildroot/package/fakeroot/fakeroot.mk	2007-04-03
15:36:03 UTC (rev 18314)
@@ -3,7 +3,7 @@
 # fakeroot
 #
 #############################################################
-FAKEROOT_VERSION:=1.6.4
+FAKEROOT_VERSION:=1.6.5
 FAKEROOT_SOURCE:=fakeroot_$(FAKEROOT_VERSION).tar.gz
 FAKEROOT_SITE:=http://ftp.debian.org/debian/pool/main/f/fakeroot
 FAKEROOT_CAT:=$(ZCAT)

_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
