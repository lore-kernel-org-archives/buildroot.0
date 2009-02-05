From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Feb 2009 13:24:08 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/mpg123
Message-ID: <20090205132408.6C79776454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-05 13:24:07 +0000 (Thu, 05 Feb 2009)
New Revision: 25247

Log:
mpg123: cleanup unused hunk after r25004

Modified:
   trunk/buildroot/package/multimedia/mpg123/mpg123.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/mpg123/mpg123.mk
===================================================================
--- trunk/buildroot/package/multimedia/mpg123/mpg123.mk	2009-02-05 13:24:01 UTC (rev 25246)
+++ trunk/buildroot/package/multimedia/mpg123/mpg123.mk	2009-02-05 13:24:07 UTC (rev 25247)
@@ -18,10 +18,6 @@
 MPG123_ALSA_DEP:=alsa-lib
 endif
 
-ifeq ($(BR2_PACKAGE_MPG123_ARM_UNROLL_FIX),y)
-MPG123_ARM_UNROLL_FIX:= -DMPG123_ARM_UNROLL_FIX
-endif
-
 $(DL_DIR)/$(MPG123_SOURCE):
 	$(call DOWNLOAD,$(MPG123_SITE),$(MPG123_SOURCE))
 
