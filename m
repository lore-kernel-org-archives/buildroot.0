From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Mar 2009 21:38:45 +0000 (UTC)
Subject: [Buildroot] svn commit: [25564] trunk/buildroot/package/avahi
Message-ID: <20090305213845.1F4CC775EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-05 21:38:44 +0000 (Thu, 05 Mar 2009)
New Revision: 25564

Log:
avahi: bump version

Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2009-03-05 21:38:40 UTC (rev 25563)
+++ trunk/buildroot/package/avahi/avahi.mk	2009-03-05 21:38:44 UTC (rev 25564)
@@ -10,7 +10,7 @@
 # either version 2.1 of the License, or (at your option) any
 # later version.
 
-AVAHI_VERSION = 0.6.22
+AVAHI_VERSION = 0.6.23
 AVAHI_SOURCE = avahi-$(AVAHI_VERSION).tar.gz
 AVAHI_SITE = http://www.avahi.org/download/
 AVAHI_INSTALL_STAGING = YES
