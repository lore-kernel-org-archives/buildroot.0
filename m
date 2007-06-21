From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 21 Jun 2007 15:07:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/vtun
Message-ID: <20070621220725.120B24866B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-21 15:07:24 -0700 (Thu, 21 Jun 2007)
New Revision: 18887

Log:
- use correct path for lzo libs and headers et al


Modified:
   trunk/buildroot/package/vtun/vtun.mk


Changeset:
Modified: trunk/buildroot/package/vtun/vtun.mk
===================================================================
--- trunk/buildroot/package/vtun/vtun.mk	2007-06-21 22:06:48 UTC (rev 18886)
+++ trunk/buildroot/package/vtun/vtun.mk	2007-06-21 22:07:24 UTC (rev 18887)
@@ -44,9 +44,9 @@
 		--localstatedir=/var \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
-		--with-ssl-headers=$(STAGING_DIR)/include/openssl \
-		--with-lzo-headers=$(STAGING_DIR)/include \
-		--with-lzo-lib=$(STAGING_DIR)/lib \
+		--with-ssl-headers=$(STAGING_DIR)/usr/include/openssl \
+		--with-lzo-headers=$(STAGING_DIR)/usr/include \
+		--with-lzo-lib=$(STAGING_DIR)/usr/lib \
 	);
 	touch $(VTUN_DIR)/.configured
 
