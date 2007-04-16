From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 16 Apr 2007 12:08:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mdadm
Message-ID: <20070416190827.A6066485B6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-04-16 12:08:27 -0700 (Mon, 16 Apr 2007)
New Revision: 18458

Log:
- doesn't build, so bump version and look..


Modified:
   trunk/buildroot/package/mdadm/mdadm.mk


Changeset:
Modified: trunk/buildroot/package/mdadm/mdadm.mk
===================================================================
--- trunk/buildroot/package/mdadm/mdadm.mk	2007-04-16 18:51:20 UTC (rev 18457)
+++ trunk/buildroot/package/mdadm/mdadm.mk	2007-04-16 19:08:27 UTC (rev 18458)
@@ -3,7 +3,7 @@
 # mdadm
 #
 #############################################################
-MDADM_VERSION:=2.4.1
+MDADM_VERSION:=2.6.1
 MDADM_SOURCE:=mdadm-$(MDADM_VERSION).tar.bz2
 MDADM_CAT:=$(BZCAT)
 MDADM_SITE:=http://www.kernel.org/pub/linux/utils/raid/mdadm
