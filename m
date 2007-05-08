From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  8 May 2007 08:57:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20070508155731.CE83148072@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-05-08 08:57:31 -0700 (Tue, 08 May 2007)
New Revision: 18584

Log:
Bumped version

Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2007-05-08 15:19:13 UTC (rev 18583)
+++ trunk/buildroot/package/avahi/avahi.mk	2007-05-08 15:57:31 UTC (rev 18584)
@@ -10,7 +10,7 @@
 # either version 2.1 of the License, or (at your option) any 
 # later version.
 
-AVAHI_VER:=0.6.14
+AVAHI_VER:=0.6.18
 AVAHI_DIR:=$(BUILD_DIR)/avahi-$(AVAHI_VER)
 AVAHI_SITE:=http://www.avahi.org/download/
 AVAHI_SOURCE:=avahi-$(AVAHI_VER).tar.gz
