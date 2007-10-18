From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Thu, 18 Oct 2007 15:40:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/olsr
Message-ID: <20071018224002.F39AEA493F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-10-18 15:40:02 -0700 (Thu, 18 Oct 2007)
New Revision: 20293

Log:
change target binary to usr/sbin/olsrd

Modified:
   trunk/buildroot/package/olsr/olsr.mk


Changeset:
Modified: trunk/buildroot/package/olsr/olsr.mk
===================================================================
--- trunk/buildroot/package/olsr/olsr.mk	2007-10-18 22:23:52 UTC (rev 20292)
+++ trunk/buildroot/package/olsr/olsr.mk	2007-10-18 22:40:02 UTC (rev 20293)
@@ -12,7 +12,7 @@
 OLSR_DIR:=$(BUILD_DIR)/olsrd-$(OLSR_VERSION)
 OLSR_CAT:=$(BZCAT)
 OLSR_BINARY:=olsrd
-OLSR_TARGET_BINARY:=usr/bin/olsrd
+OLSR_TARGET_BINARY:=usr/sbin/olsrd
 #OLSR_PLUGINS=httpinfo tas dot_draw nameservice dyn_gw dyn_gw_plain pgraph bmf quagga secure
 OLSR_PLUGINS=dot_draw dyn_gw secure
 OLSR_TARGET_PLUGIN=usr/lib/
