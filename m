From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 25 Jul 2007 10:41:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/portage
Message-ID: <20070725174116.34369A5E31@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-25 10:41:15 -0700 (Wed, 25 Jul 2007)
New Revision: 19263

Log:
Use better Sandbox site

Modified:
   trunk/buildroot/package/portage/portage.mk


Changeset:
Modified: trunk/buildroot/package/portage/portage.mk
===================================================================
--- trunk/buildroot/package/portage/portage.mk	2007-07-25 17:39:46 UTC (rev 19262)
+++ trunk/buildroot/package/portage/portage.mk	2007-07-25 17:41:15 UTC (rev 19263)
@@ -17,7 +17,8 @@
 
 SANDBOX_VERSION:=1.2.18.1
 SANDBOX_SOURCE:=sandbox-$(SANDBOX_VERSION).tar.bz2
-SANDBOX_SITE:=$(PORTAGE_SITE)
+SANDBOX_SITE:=http://dev.gentoo.org/~azarah/sandbox/
+#SANDBOX_SITE:=$(PORTAGE_SITE)
 SANDBOX_CAT:=$(PORTAGE_CAT)
 SANDBOX_DIR:=$(BUILD_DIR)/sandbox-$(SANDBOX_VERSION)
 SANDBOX_TARGET_BINARY:=usr/bin/sandbox
