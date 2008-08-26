From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 13:46:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/blackbox
Message-ID: <20080826204651.A69F03C7EC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-26 13:46:51 -0700 (Tue, 26 Aug 2008)
New Revision: 23213

Log:
blackbox: use BR2_SOURCEFORGE_MIRROR

Don't hardcode specific sourceforge mirrors.

Modified:
   trunk/buildroot/package/blackbox/blackbox.mk


Changeset:
Modified: trunk/buildroot/package/blackbox/blackbox.mk
===================================================================
--- trunk/buildroot/package/blackbox/blackbox.mk	2008-08-26 20:09:08 UTC (rev 23212)
+++ trunk/buildroot/package/blackbox/blackbox.mk	2008-08-26 20:46:51 UTC (rev 23213)
@@ -6,7 +6,7 @@
 
 BLACKBOX_VERSION = 0.70.1
 BLACKBOX_SOURCE = blackbox-$(BLACKBOX_VERSION).tar.bz2
-BLACKBOX_SITE = http://superb-west.dl.sourceforge.net/sourceforge/blackboxwm/
+BLACKBOX_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/blackboxwm/
 BLACKBOX_AUTORECONF = NO
 BLACKBOX_INSTALL_STAGING = NO
 BLACKBOX_INSTALL_TARGET = YES
