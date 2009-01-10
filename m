From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 10 Jan 2009 00:27:35 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/olsr
Message-ID: <20090110002735.4D4017688F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-10 00:27:34 +0000 (Sat, 10 Jan 2009)
New Revision: 24740

Log:
Buop version of olsr to 0.5.6 which builds correctly

Modified:
   trunk/buildroot/package/olsr/olsr.mk


Changeset:
Modified: trunk/buildroot/package/olsr/olsr.mk
===================================================================
--- trunk/buildroot/package/olsr/olsr.mk	2009-01-10 00:26:30 UTC (rev 24739)
+++ trunk/buildroot/package/olsr/olsr.mk	2009-01-10 00:27:34 UTC (rev 24740)
@@ -5,7 +5,7 @@
 #############################################################
 
 OLSR_VERSION_MAJOR=0.5
-OLSR_VERSION_MINOR=4
+OLSR_VERSION_MINOR=6
 OLSR_VERSION:=$(OLSR_VERSION_MAJOR).$(OLSR_VERSION_MINOR)
 OLSR_SOURCE:=olsrd-$(OLSR_VERSION).tar.bz2
 OLSR_SITE:=http://www.olsr.org/releases/$(OLSR_VERSION_MAJOR)
