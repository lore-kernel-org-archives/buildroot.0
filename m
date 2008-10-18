From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 18 Oct 2008 00:00:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
Message-ID: <20081018070035.85E713C814@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-18 00:00:35 -0700 (Sat, 18 Oct 2008)
New Revision: 23707

Log:
Bump up libgtk2 version

Bump up libgtk2 version

The version of libgtk2 currently used doesn't build when built against
DirectFB. The issue has been fixed in a later version of the 2.12.x
series, so let's upgrade to this version.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Modified:
   trunk/buildroot/package/libgtk2/libgtk2.mk


Changeset:
Modified: trunk/buildroot/package/libgtk2/libgtk2.mk
===================================================================
--- trunk/buildroot/package/libgtk2/libgtk2.mk	2008-10-17 14:11:04 UTC (rev 23706)
+++ trunk/buildroot/package/libgtk2/libgtk2.mk	2008-10-18 07:00:35 UTC (rev 23707)
@@ -3,7 +3,7 @@
 # libgtk2.0
 #
 #############################################################
-LIBGTK2_VERSION = 2.12.6
+LIBGTK2_VERSION = 2.12.12
 LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.bz2
 LIBGTK2_SITE = ftp://ftp.gtk.org/pub/gtk/2.12
 LIBGTK2_AUTORECONF = NO
