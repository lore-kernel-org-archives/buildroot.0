From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 10 Jan 2007 23:25:29 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/jpeg
Message-ID: <20070111072529.762BD48583@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-10 23:25:29 -0800 (Wed, 10 Jan 2007)
New Revision: 17241

Log:
be explicit about not doing X


Modified:
   trunk/buildroot/package/jpeg/jpeg.mk


Changeset:
Modified: trunk/buildroot/package/jpeg/jpeg.mk
===================================================================
--- trunk/buildroot/package/jpeg/jpeg.mk	2007-01-11 07:25:01 UTC (rev 17240)
+++ trunk/buildroot/package/jpeg/jpeg.mk	2007-01-11 07:25:29 UTC (rev 17241)
@@ -46,6 +46,7 @@
 		--prefix=$(STAGING_DIR) \
 		--enable-shared \
 		--enable-static \
+		--without-x \
 	);
 	touch $(JPEG_DIR)/.configured
 
