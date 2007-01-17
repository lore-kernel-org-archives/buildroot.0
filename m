From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 17 Jan 2007 06:14:04 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/rdesktop
Message-ID: <20070117141404.755D748582@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-01-17 06:14:02 -0800 (Wed, 17 Jan 2007)
New Revision: 17346

Log:
removed leftover debugging stuff

Modified:
   trunk/buildroot/package/rdesktop/rdesktop.mk


Changeset:
Modified: trunk/buildroot/package/rdesktop/rdesktop.mk
===================================================================
--- trunk/buildroot/package/rdesktop/rdesktop.mk	2007-01-17 13:58:01 UTC (rev 17345)
+++ trunk/buildroot/package/rdesktop/rdesktop.mk	2007-01-17 14:14:02 UTC (rev 17346)
@@ -29,7 +29,6 @@
 		--with-openssl=$(STAGING_DIR) \
 		--sysconfdir=/etc \
 	);
-	read
 	touch $(RDESKTOP_DIR)/.configured
 
 $(RDESKTOP_DIR)/rdesktop: $(RDESKTOP_DIR)/.configured
