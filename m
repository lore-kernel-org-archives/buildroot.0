From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  4 Nov 2008 14:29:02 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/matchbox
Message-ID: <20081104222902.506513C844@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-04 14:29:02 -0800 (Tue, 04 Nov 2008)
New Revision: 23927

Log:
matchbox: fix prefix

Closes #5946.

Modified:
   trunk/buildroot/package/matchbox/matchbox.mk


Changeset:
Modified: trunk/buildroot/package/matchbox/matchbox.mk
===================================================================
--- trunk/buildroot/package/matchbox/matchbox.mk	2008-11-04 22:28:58 UTC (rev 23926)
+++ trunk/buildroot/package/matchbox/matchbox.mk	2008-11-04 22:29:02 UTC (rev 23927)
@@ -222,7 +222,7 @@
 	--host=$(GNU_TARGET_NAME) \
 	--build=$(GNU_HOST_NAME) \
 	--disable-static \
-	--prefix=$(STAGING_DIR)/usr \
+	--prefix=/usr \
 	--sysconfdir=/etc \
 	--localstatedir=/var \
 	--datadir=/usr/share/matchbox \
@@ -248,12 +248,12 @@
 	--host=$(GNU_TARGET_NAME) \
 	--build=$(GNU_HOST_NAME) \
 	--disable-static \
-	--prefix=$(STAGING_DIR)/usr \
+	--prefix=/usr \
 	--sysconfdir=/etc \
 	--localstatedir=/var \
 	--datadir=/usr/share \
 	--libdir=$(STAGING_DIR)/usr/lib \
-	--includedir=$(STAGING_DIR)/usr/include \
+	--includedir=/usr/include \
 	--with-x \
 	--x-includes=$(STAGING_DIR)/usr/include/X11 \
 	--x-libraries=$(STAGING_DIR)/usr/lib \
@@ -268,7 +268,7 @@
 	--host=$(GNU_TARGET_NAME) \
 	--build=$(GNU_HOST_NAME) \
 	--disable-static \
-	--prefix=$(STAGING_DIR)/usr \
+	--prefix=/usr \
 	--sysconfdir=/etc \
 	--localstatedir=/var \
 	--datadir=/usr/share/matchbox \
@@ -293,7 +293,7 @@
 	--host=$(GNU_TARGET_NAME) \
 	--build=$(GNU_HOST_NAME) \
 	--disable-static \
-	--prefix=$(STAGING_DIR)/usr \
+	--prefix=/usr \
 	--sysconfdir=/etc \
 	--localstatedir=/var \
 	--datadir=/usr/share/matchbox \
@@ -317,7 +317,7 @@
 	--host=$(GNU_TARGET_NAME) \
 	--build=$(GNU_HOST_NAME) \
 	--disable-static \
-	--prefix=$(STAGING_DIR)/usr \
+	--prefix=/usr \
 	--sysconfdir=/etc \
 	--localstatedir=/var \
 	--datadir=/usr/share/matchbox \
@@ -340,12 +340,12 @@
 	--host=$(GNU_TARGET_NAME) \
 	--build=$(GNU_HOST_NAME) \
 	--disable-static \
-	--prefix=$(STAGING_DIR)/usr \
+	--prefix=/usr \
 	--sysconfdir=/etc \
 	--localstatedir=/var \
 	--datadir=/usr/share/matchbox \
-	--libdir=$(STAGING_DIR)/usr/lib \
-	--includedir=$(STAGING_DIR)/usr/include \
+	--libdir=/usr/lib \
+	--includedir=/usr/include \
 	--enable-expat \
 	--with-expat-includes=$(STAGING_DIR)/usr/include \
 	--with-expat-lib=$(STAGING_DIR)/usr/lib \
@@ -364,7 +364,7 @@
 	--host=$(GNU_TARGET_NAME) \
 	--build=$(GNU_HOST_NAME) \
 	--disable-static \
-	--prefix=$(STAGING_DIR)/usr \
+	--prefix=/usr \
 	--sysconfdir=/etc \
 	--localstatedir=/var \
 	--datadir=/usr/share/matchbox \
@@ -388,7 +388,7 @@
 	--host=$(GNU_TARGET_NAME) \
 	--build=$(GNU_HOST_NAME) \
 	--disable-static \
-	--prefix=$(STAGING_DIR)/usr \
+	--prefix=/usr \
 	--sysconfdir=/etc \
 	--localstatedir=/var \
 	--datadir=/usr/share/matchbox \
@@ -412,7 +412,7 @@
 	--host=$(GNU_TARGET_NAME) \
 	--build=$(GNU_HOST_NAME) \
 	--disable-static \
-	--prefix=$(STAGING_DIR)/usr \
+	--prefix=/usr \
 	--sysconfdir=/etc \
 	--localstatedir=/var \
 	--datadir=/usr/share/matchbox \
