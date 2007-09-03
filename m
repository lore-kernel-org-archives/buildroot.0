From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  3 Sep 2007 02:02:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20070903090210.10AEDA659E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-09-03 02:02:10 -0700 (Mon, 03 Sep 2007)
New Revision: 19773

Log:
Bumped version

Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2007-09-03 09:00:18 UTC (rev 19772)
+++ trunk/buildroot/package/avahi/avahi.mk	2007-09-03 09:02:10 UTC (rev 19773)
@@ -10,7 +10,7 @@
 # either version 2.1 of the License, or (at your option) any
 # later version.
 
-AVAHI_VERSION:=0.6.19
+AVAHI_VERSION:=0.6.21
 AVAHI_DIR:=$(BUILD_DIR)/avahi-$(AVAHI_VERSION)
 AVAHI_SITE:=http://www.avahi.org/download/
 AVAHI_SOURCE:=avahi-$(AVAHI_VERSION).tar.gz
