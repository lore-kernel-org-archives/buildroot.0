From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 24 Aug 2006 15:00:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/expat
Message-ID: <20060824220036.6747348AA1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-08-24 15:00:36 -0700 (Thu, 24 Aug 2006)
New Revision: 15988

Log:
- update to 2.0.0 and correct site.


Modified:
   trunk/buildroot/package/expat/expat.mk


Changeset:
Modified: trunk/buildroot/package/expat/expat.mk
===================================================================
--- trunk/buildroot/package/expat/expat.mk	2006-08-24 21:46:57 UTC (rev 15987)
+++ trunk/buildroot/package/expat/expat.mk	2006-08-24 22:00:36 UTC (rev 15988)
@@ -4,10 +4,10 @@
 #
 #############################################################
 
-EXPAT_VERSION=1.95.8
+EXPAT_VERSION=2.0.0
 
 EXPAT_SOURCE=expat-$(EXPAT_VERSION).tar.gz
-EXPAT_SITE=http://internap.dl.sourceforge.net/sourceforge/expat
+EXPAT_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/expat
 EXPAT_DIR:=$(BUILD_DIR)/expat-$(EXPAT_VERSION)
 
 $(DL_DIR)/$(EXPAT_SOURCE):
