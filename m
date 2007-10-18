From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 18 Oct 2007 15:59:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/hotplug
Message-ID: <20071018225946.F2D91A4A33@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-18 15:59:44 -0700 (Thu, 18 Oct 2007)
New Revision: 20294

Log:
Hotplug source is inside buildroot

Modified:
   trunk/buildroot/package/hotplug/hotplug.mk


Changeset:
Modified: trunk/buildroot/package/hotplug/hotplug.mk
===================================================================
--- trunk/buildroot/package/hotplug/hotplug.mk	2007-10-18 22:40:02 UTC (rev 20293)
+++ trunk/buildroot/package/hotplug/hotplug.mk	2007-10-18 22:59:44 UTC (rev 20294)
@@ -26,7 +26,7 @@
 
 hotplug: uclibc $(TARGET_DIR)/sbin/hotplug
 
-hotplug-source: $(DL_DIR)/$(HOTPLUG_SOURCE)
+hotplug-source: $(HOTPLUG_SOURCE)
 
 hotplug-clean:
 	rm -f $(TARGET_DIR)/sbin/hotplug
