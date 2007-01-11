From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 10 Jan 2007 23:26:02 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libpng
Message-ID: <20070111072602.91B814858C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-10 23:26:02 -0800 (Wed, 10 Jan 2007)
New Revision: 17242

Log:
be explicit about not depending on X, dep should go the other way


Modified:
   trunk/buildroot/package/libpng/libpng.mk


Changeset:
Modified: trunk/buildroot/package/libpng/libpng.mk
===================================================================
--- trunk/buildroot/package/libpng/libpng.mk	2007-01-11 07:25:29 UTC (rev 17241)
+++ trunk/buildroot/package/libpng/libpng.mk	2007-01-11 07:26:02 UTC (rev 17242)
@@ -55,6 +55,7 @@
 		--libdir=$(STAGING_DIR)/lib \
 		--includedir=$(STAGING_DIR)/include \
 		--without-libpng-compat \
+		--without-x \
 	);
 	touch $(LIBPNG_DIR)/.configured
 
