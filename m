From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 28 Aug 2007 01:05:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/avahi
Message-ID: <20070828080527.9EAAEA6066@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-08-28 01:05:25 -0700 (Tue, 28 Aug 2007)
New Revision: 19709

Log:
expat now installs into usr/lib

Modified:
   trunk/buildroot/package/avahi/avahi.mk


Changeset:
Modified: trunk/buildroot/package/avahi/avahi.mk
===================================================================
--- trunk/buildroot/package/avahi/avahi.mk	2007-08-27 21:51:27 UTC (rev 19708)
+++ trunk/buildroot/package/avahi/avahi.mk	2007-08-28 08:05:25 UTC (rev 19709)
@@ -27,7 +27,7 @@
 AVAHI_DISABLE_EXPAT:=
 # depend on the exact library file instead of expat so avahi isn't always
 # considered out-of-date
-AVAHI_EXPAT_DEP:=$(STAGING_DIR)/lib/libexpat.so.1
+AVAHI_EXPAT_DEP:=$(STAGING_DIR)/usr/lib/libexpat.so.1
 else
 AVAHI_DISABLE_EXPAT:=--disable-expat
 AVAHI_EXPAT_DEP:=
