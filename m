From: andersen@uclibc.org <andersen@uclibc.org>
Date: Thu Jul 27 11:30:27 2006
Subject: [Buildroot] svn commit: trunk/buildroot/package/tinyx
Message-ID: <20060727183025.7237348C13@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-07-27 11:30:24 -0700 (Thu, 27 Jul 2006)
New Revision: 15755

Log:
Stupid make needs tabs.  Fix broken whitespace


Modified:
   trunk/buildroot/package/tinyx/tinyx.mk


Changeset:
Modified: trunk/buildroot/package/tinyx/tinyx.mk
===================================================================
--- trunk/buildroot/package/tinyx/tinyx.mk	2006-07-27 16:40:55 UTC (rev 15754)
+++ trunk/buildroot/package/tinyx/tinyx.mk	2006-07-27 18:30:24 UTC (rev 15755)
@@ -103,11 +103,11 @@
 # Install x-includes and x-libraries in $(STAGING_DIR)/usr/X11R6/
 # and add a symbolic link between /usr/bin/X11 and /usr/X11R6/bin
 $(STAGING_DIR)/usr/X11R6/lib/libX11.so.6.2: $(TINYX_XFBDEV)
-       mkdir -p $(STAGING_DIR)/usr/X11R6/lib
-       mkdir -p $(STAGING_DIR)/usr/X11R6/include
-       cp -fRL $(TINYX_DIR)/exports/include/* $(STAGING_DIR)/usr/X11R6/include/
-       cp -fRL $(TINYX_DIR)/exports/lib/* $(STAGING_DIR)/usr/X11R6/lib/
-       ln -s /usr/X11R6/bin $(TARGET_DIR)/usr/bin/X11
+	mkdir -p $(STAGING_DIR)/usr/X11R6/lib
+	mkdir -p $(STAGING_DIR)/usr/X11R6/include
+	cp -fRL $(TINYX_DIR)/exports/include/* $(STAGING_DIR)/usr/X11R6/include/
+	cp -fRL $(TINYX_DIR)/exports/lib/* $(STAGING_DIR)/usr/X11R6/lib/
+	ln -s /usr/X11R6/bin $(TARGET_DIR)/usr/bin/X11
 
 #
 # Once Frame Buffer is built, we install executables.
