From: andersen at uclibc.org <andersen@uclibc.org>
Date: Mon, 15 Jan 2007 13:27:17 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/expat
Message-ID: <20070115212717.D0EDC48594@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-15 13:27:17 -0800 (Mon, 15 Jan 2007)
New Revision: 17316

Log:
lose the extra space


Modified:
   trunk/buildroot/package/expat/expat.mk


Changeset:
Modified: trunk/buildroot/package/expat/expat.mk
===================================================================
--- trunk/buildroot/package/expat/expat.mk	2007-01-15 21:26:43 UTC (rev 17315)
+++ trunk/buildroot/package/expat/expat.mk	2007-01-15 21:27:17 UTC (rev 17316)
@@ -5,7 +5,6 @@
 #############################################################
 
 EXPAT_VERSION=2.0.0
-
 EXPAT_SOURCE=expat-$(EXPAT_VERSION).tar.gz
 EXPAT_CAT:=$(ZCAT)
 EXPAT_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/expat
