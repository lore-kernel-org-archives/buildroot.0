From: andersen at uclibc.org <andersen@uclibc.org>
Date: Sun, 14 Jan 2007 14:52:27 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: freetype libpng
Message-ID: <20070114225227.CC459485FD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-14 14:52:26 -0800 (Sun, 14 Jan 2007)
New Revision: 17306

Log:
silly typos


Modified:
   trunk/buildroot/package/freetype/freetype.mk
   trunk/buildroot/package/libpng/libpng.mk


Changeset:
Modified: trunk/buildroot/package/freetype/freetype.mk
===================================================================
--- trunk/buildroot/package/freetype/freetype.mk	2007-01-14 22:18:49 UTC (rev 17305)
+++ trunk/buildroot/package/freetype/freetype.mk	2007-01-14 22:52:26 UTC (rev 17306)
@@ -52,7 +52,7 @@
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)\',g" \
 		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
 		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/include\',g" \
-		"s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" \
+		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" \
 		$(STAGING_DIR)/usr/bin/freetype-config
 	touch -c $(STAGING_DIR)/lib/libfreetype.so
 

Modified: trunk/buildroot/package/libpng/libpng.mk
===================================================================
--- trunk/buildroot/package/libpng/libpng.mk	2007-01-14 22:18:49 UTC (rev 17305)
+++ trunk/buildroot/package/libpng/libpng.mk	2007-01-14 22:52:26 UTC (rev 17306)
@@ -77,7 +77,7 @@
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)\',g" \
 		-e "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" \
 		-e "s,^includedir=.*,includedir=\'$(STAGING_DIR)/include/libpng12\',g" \
-		"s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" \
+		-e "s,^libdir=.*,libdir=\'$(STAGING_DIR)/lib\',g" \
 		$(STAGING_DIR)/usr/bin/libpng12-config
 	touch -c $(STAGING_DIR)/lib/libpng.so
 
