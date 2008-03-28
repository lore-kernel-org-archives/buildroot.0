From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 28 Mar 2008 03:39:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ipkg
Message-ID: <20080328103948.4B13C3C364@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-28 03:39:48 -0700 (Fri, 28 Mar 2008)
New Revision: 21533

Log:
ipkg: use http url


Modified:
   trunk/buildroot/package/ipkg/ipkg.mk


Changeset:
Modified: trunk/buildroot/package/ipkg/ipkg.mk
===================================================================
--- trunk/buildroot/package/ipkg/ipkg.mk	2008-03-28 10:39:38 UTC (rev 21532)
+++ trunk/buildroot/package/ipkg/ipkg.mk	2008-03-28 10:39:48 UTC (rev 21533)
@@ -6,7 +6,7 @@
 
 IPKG_VERSION = 0.99.163
 IPKG_SOURCE = ipkg-$(IPKG_VERSION).tar.gz
-IPKG_SITE = ftp://ftp.handhelds.org/packages/ipkg
+IPKG_SITE = http://ftp.handhelds.org/packages/ipkg
 IPKG_AUTORECONF = NO
 IPKG_INSTALL_STAGING = YES
 IPKG_INSTALL_TARGET = YES
