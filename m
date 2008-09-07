From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  7 Sep 2008 07:31:36 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/database/mysql_client
Message-ID: <20080907143136.4CFDF3C642@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-07 07:31:36 -0700 (Sun, 07 Sep 2008)
New Revision: 23353

Log:
mysql_client: fix paths

Patch by Markus Heidelberg <markus.heidelberg@web.de>

Modified:
   trunk/buildroot/package/database/mysql_client/mysql_client.mk


Changeset:
Modified: trunk/buildroot/package/database/mysql_client/mysql_client.mk
===================================================================
--- trunk/buildroot/package/database/mysql_client/mysql_client.mk	2008-09-07 14:31:32 UTC (rev 23352)
+++ trunk/buildroot/package/database/mysql_client/mysql_client.mk	2008-09-07 14:31:36 UTC (rev 23353)
@@ -27,4 +27,4 @@
 	--enable-thread-safe-client \
 	$(ENABLE_DEBUG)
 
-$(eval $(call AUTOTARGETS,package,mysql_client))
+$(eval $(call AUTOTARGETS,package/database,mysql_client))
