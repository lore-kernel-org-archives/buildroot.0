From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 12 Jun 2007 08:19:30 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20070612151930.0A3AE4800F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-06-12 08:19:27 -0700 (Tue, 12 Jun 2007)
New Revision: 18802

Log:
Bumped version

Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2007-06-12 13:21:08 UTC (rev 18801)
+++ trunk/buildroot/package/avahi/avahi.mk	2007-06-12 15:19:27 UTC (rev 18802)
@@ -10,7 +10,7 @@
 # either version 2.1 of the License, or (at your option) any 
 # later version.
 
-AVAHI_VER:=0.6.18
+AVAHI_VER:=0.6.19
 AVAHI_DIR:=$(BUILD_DIR)/avahi-$(AVAHI_VER)
 AVAHI_SITE:=http://www.avahi.org/download/
 AVAHI_SOURCE:=avahi-$(AVAHI_VER).tar.gz
