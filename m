From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 23 Jul 2007 05:22:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fbv
Message-ID: <20070723122239.57582A6ABD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-23 05:22:37 -0700 (Mon, 23 Jul 2007)
New Revision: 19226

Log:
cleanup fbv package

Modified:
   trunk/buildroot/package/fbv/fbv.mk


Changeset:
Modified: trunk/buildroot/package/fbv/fbv.mk
===================================================================
--- trunk/buildroot/package/fbv/fbv.mk	2007-07-23 12:19:59 UTC (rev 19225)
+++ trunk/buildroot/package/fbv/fbv.mk	2007-07-23 12:22:37 UTC (rev 19226)
@@ -22,7 +22,7 @@
 $(FBV_DIR)/.configured: $(FBV_DIR)/.unpacked
 	(cd $(FBV_DIR); \
 		($(TARGET_CONFIGURE_OPTS) \
-		($(TARGET_CONFIGURE_ARGS) \
+		$(TARGET_CONFIGURE_ARGS) \
 		./configure \
 		--prefix=/usr \
 		--cc=$(TARGET_CC) \
