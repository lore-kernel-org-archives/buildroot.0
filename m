From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 18 Apr 2009 14:13:49 +0000 (UTC)
Subject: [Buildroot] svn commit: [26150] trunk/buildroot/package/cups
Message-ID: <20090418141349.859A377196@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-18 14:13:49 +0000 (Sat, 18 Apr 2009)
New Revision: 26150

Log:
cups: add -source target

Modified:
   trunk/buildroot/package/cups/cups.mk


Changeset:
Modified: trunk/buildroot/package/cups/cups.mk
===================================================================
--- trunk/buildroot/package/cups/cups.mk	2009-04-18 13:05:10 UTC (rev 26149)
+++ trunk/buildroot/package/cups/cups.mk	2009-04-18 14:13:49 UTC (rev 26150)
@@ -105,6 +105,8 @@
 
 cups: uclibc $(CUPS_DEPENDENCIES) $(CUPS_DIR)/.installed
 
+cups-source: $(DL_DIR)/$(CUPS_SOURCE)
+
 cups-clean:
 	-$(MAKE) -C $(CUPS_DIR) clean
 
