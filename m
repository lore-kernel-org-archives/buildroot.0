From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Tue, 11 Dec 2007 11:53:54 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/olsr
Message-ID: <20071211195354.3BF1F12854E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-12-11 11:53:51 -0800 (Tue, 11 Dec 2007)
New Revision: 20638

Log:
bump olsr version

Modified:
   trunk/buildroot/package/olsr/olsr.mk


Changeset:
Modified: trunk/buildroot/package/olsr/olsr.mk
===================================================================
--- trunk/buildroot/package/olsr/olsr.mk	2007-12-11 13:15:11 UTC (rev 20637)
+++ trunk/buildroot/package/olsr/olsr.mk	2007-12-11 19:53:51 UTC (rev 20638)
@@ -5,7 +5,7 @@
 #############################################################
 
 OLSR_VERSION_MAJOR=0.5
-OLSR_VERSION_MINOR=3
+OLSR_VERSION_MINOR=4
 OLSR_VERSION:=$(OLSR_VERSION_MAJOR).$(OLSR_VERSION_MINOR)
 OLSR_SOURCE:=olsrd-$(OLSR_VERSION).tar.bz2
 OLSR_SITE:=http://www.olsr.org/releases/$(OLSR_VERSION_MAJOR)
