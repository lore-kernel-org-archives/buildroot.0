From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  9 Oct 2006 04:53:10 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/wireless-tools
Message-ID: <20061009115310.B78C9485D8@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2006-10-09 04:53:10 -0700 (Mon, 09 Oct 2006)
New Revision: 16346

Log:
Bump version (patch by Fredrik Roubert)

Modified:
   trunk/buildroot/package/wireless-tools/wireless-tools.mk


Changeset:
Modified: trunk/buildroot/package/wireless-tools/wireless-tools.mk
===================================================================
--- trunk/buildroot/package/wireless-tools/wireless-tools.mk	2006-10-09 11:41:34 UTC (rev 16345)
+++ trunk/buildroot/package/wireless-tools/wireless-tools.mk	2006-10-09 11:53:10 UTC (rev 16346)
@@ -9,9 +9,9 @@
 # Jean II
 # v28.pre3 -> earliest possible
 WIRELESS_TOOLS_VER:=28
-WIRELESS_TOOLS_SUBVER:=.pre3
+WIRELESS_TOOLS_SUBVER:=
 
-WIRELESS_TOOLS_SOURCE_URL:=http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux
+WIRELESS_TOOLS_SOURCE_URL:=http://pcmcia-cs.sourceforge.net/ftp/contrib
 WIRELESS_TOOLS_SOURCE:=wireless_tools.$(WIRELESS_TOOLS_VER)$(WIRELESS_TOOLS_SUBVER).tar.gz
 WIRELESS_TOOLS_BUILD_DIR=$(BUILD_DIR)/wireless_tools.$(WIRELESS_TOOLS_VER)
 
