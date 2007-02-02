From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri,  2 Feb 2007 04:41:17 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
Message-ID: <20070202124117.52C9D485E3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-02-02 04:41:16 -0800 (Fri, 02 Feb 2007)
New Revision: 17722

Log:
0.9.25.1 release moved to Old. Reported by Jack Robinson

Modified:
   trunk/buildroot/package/directfb/directfb.mk


Changeset:
Modified: trunk/buildroot/package/directfb/directfb.mk
===================================================================
--- trunk/buildroot/package/directfb/directfb.mk	2007-02-02 12:32:27 UTC (rev 17721)
+++ trunk/buildroot/package/directfb/directfb.mk	2007-02-02 12:41:16 UTC (rev 17722)
@@ -5,7 +5,7 @@
 #############################################################
 DIRECTFB_VERSION:=0.9.25.1
 DIRECTFB_SOURCE:=DirectFB-$(DIRECTFB_VERSION).tar.gz
-DIRECTFB_SITE:=http://www.directfb.org/downloads/Core
+DIRECTFB_SITE:=http://www.directfb.org/downloads/Old
 DIRECTFB_CAT:=$(ZCAT)
 DIRECTFB_DIR:=$(BUILD_DIR)/DirectFB-$(DIRECTFB_VERSION)
 
