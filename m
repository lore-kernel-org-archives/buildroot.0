From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Thu, 18 Oct 2007 14:55:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/wireless-tools
Message-ID: <20071018215509.D9158A65F7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-10-18 14:55:09 -0700 (Thu, 18 Oct 2007)
New Revision: 20291

Log:
updated wireless-tools to .29 version, thanks to sushisan

Modified:
   trunk/buildroot/package/wireless-tools/wireless-tools.mk


Changeset:
Modified: trunk/buildroot/package/wireless-tools/wireless-tools.mk
===================================================================
--- trunk/buildroot/package/wireless-tools/wireless-tools.mk	2007-10-18 21:49:35 UTC (rev 20290)
+++ trunk/buildroot/package/wireless-tools/wireless-tools.mk	2007-10-18 21:55:09 UTC (rev 20291)
@@ -8,10 +8,10 @@
 # which is available in 28-pre3 and later...
 # Jean II
 # v28.pre3 -> earliest possible
-WIRELESS_TOOLS_VERSION:=28
+WIRELESS_TOOLS_VERSION:=29
 WIRELESS_TOOLS_SUBVER:=
 
-WIRELESS_TOOLS_SOURCE_URL:=http://pcmcia-cs.sourceforge.net/ftp/contrib
+WIRELESS_TOOLS_SOURCE_URL:=http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/
 WIRELESS_TOOLS_SOURCE:=wireless_tools.$(WIRELESS_TOOLS_VERSION)$(WIRELESS_TOOLS_SUBVER).tar.gz
 WIRELESS_TOOLS_BUILD_DIR=$(BUILD_DIR)/wireless_tools.$(WIRELESS_TOOLS_VERSION)
 
