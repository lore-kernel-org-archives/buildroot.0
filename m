From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 25 Aug 2008 02:04:52 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/psmisc
Message-ID: <20080825090452.DA7593C717@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-25 02:04:49 -0700 (Mon, 25 Aug 2008)
New Revision: 23198

Log:
psmisc: bump version

Modified:
   trunk/buildroot/package/psmisc/psmisc.mk


Changeset:
Modified: trunk/buildroot/package/psmisc/psmisc.mk
===================================================================
--- trunk/buildroot/package/psmisc/psmisc.mk	2008-08-25 09:04:39 UTC (rev 23197)
+++ trunk/buildroot/package/psmisc/psmisc.mk	2008-08-25 09:04:49 UTC (rev 23198)
@@ -3,7 +3,7 @@
 # psmisc
 #
 #############################################################
-PSMISC_VERSION:=22.2
+PSMISC_VERSION:=22.6
 PSMISC_SOURCE:=psmisc-$(PSMISC_VERSION).tar.gz
 PSMISC_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/psmisc
 PSMISC_AUTORECONF:=no
