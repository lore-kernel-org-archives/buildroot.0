From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  6 Oct 2006 06:01:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mtd
Message-ID: <20061006130129.E1C2A48568@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-10-06 06:01:29 -0700 (Fri, 06 Oct 2006)
New Revision: 16319

Log:
- be gentle to vi syntax color mode


Modified:
   trunk/buildroot/package/mtd/mtd.mk


Changeset:
Modified: trunk/buildroot/package/mtd/mtd.mk
===================================================================
--- trunk/buildroot/package/mtd/mtd.mk	2006-10-06 13:00:57 UTC (rev 16318)
+++ trunk/buildroot/package/mtd/mtd.mk	2006-10-06 13:01:29 UTC (rev 16319)
@@ -14,7 +14,7 @@
 MTD_UNZIP:=bzcat
 else
 MTD_SOURCE:=$(strip $(subst ",, $(BR2_PACKAGE_MTD_ORIG_STRING)))
-#"
+#"))
 MTD_SITE:=http://ftp.debian.org/debian/pool/main/m/mtd
 MTD_HOST_DIR := $(TOOL_BUILD_DIR)/mtd_orig
 MTD_DIR:=$(BUILD_DIR)/mtd_orig
