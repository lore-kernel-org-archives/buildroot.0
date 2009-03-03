From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  3 Mar 2009 22:23:22 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/vtun
Message-ID: <20090303222323.046CB7626F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-03 22:23:22 +0000 (Tue, 03 Mar 2009)
New Revision: 25515

Log:
vtun: provide correct location for lzo headers

Patch by Robert Urban <urban@unix-beratung.de>

Modified:
   trunk/buildroot/package/vtun/vtun.mk


Changeset:
Modified: trunk/buildroot/package/vtun/vtun.mk
===================================================================
--- trunk/buildroot/package/vtun/vtun.mk	2009-03-03 22:09:58 UTC (rev 25514)
+++ trunk/buildroot/package/vtun/vtun.mk	2009-03-03 22:23:22 UTC (rev 25515)
@@ -50,7 +50,7 @@
 		--mandir=/usr/man \
 		--infodir=/usr/info \
 		--with-ssl-headers=$(STAGING_DIR)/usr/include/openssl \
-		--with-lzo-headers=$(STAGING_DIR)/usr/include \
+		--with-lzo-headers=$(STAGING_DIR)/usr/include/lzo \
 		--with-lzo-lib=$(STAGING_DIR)/usr/lib \
 	)
 	touch $(VTUN_DIR)/.configured
