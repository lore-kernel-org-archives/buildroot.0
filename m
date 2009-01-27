From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 27 Jan 2009 05:43:31 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/alsa-lib
Message-ID: <20090127054331.694EA76852@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-27 05:43:29 +0000 (Tue, 27 Jan 2009)
New Revision: 25072

Log:
alsa-lib: fix typo in -source target

Modified:
   trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk
===================================================================
--- trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk	2009-01-26 23:52:31 UTC (rev 25071)
+++ trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk	2009-01-27 05:43:29 UTC (rev 25072)
@@ -77,7 +77,7 @@
 
 alsa-lib: uclibc $(ALSA_LIB_DEPS) $(TARGET_DIR)/$(ALSA_LIB_TARGET_BINARY)
 
-alsa-lib-source: $(DL_DIR)/$(ALSA-LIB_SOURCE)
+alsa-lib-source: $(DL_DIR)/$(ALSA_LIB_SOURCE)
 
 alsa-lib-clean:
 	rm -f $(TARGET_DIR)/$(ALSA_LIB_TARGET_BINARY)
