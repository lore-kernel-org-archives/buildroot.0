From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Feb 2009 13:24:22 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/mpg123
Message-ID: <20090205132422.BA38576454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-05 13:24:22 +0000 (Thu, 05 Feb 2009)
New Revision: 25251

Log:
mpg123: remove unused mpg123x target (debug?)

Modified:
   trunk/buildroot/package/multimedia/mpg123/mpg123.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/mpg123/mpg123.mk
===================================================================
--- trunk/buildroot/package/multimedia/mpg123/mpg123.mk	2009-02-05 13:24:18 UTC (rev 25250)
+++ trunk/buildroot/package/multimedia/mpg123/mpg123.mk	2009-02-05 13:24:22 UTC (rev 25251)
@@ -55,9 +55,6 @@
 
 mpg123: uclibc $(MPG123_ALSA_DEP) $(TARGET_DIR)/$(MPG123_TARGET_BIN)
 
-mpg123x: 
-	touch $(MPG123_DIR)/.configured
-
 mpg123-unpacked: $(MPG123_DIR)/.unpacked
 
 mpg123-clean:
