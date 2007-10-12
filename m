From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 12 Oct 2007 08:16:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel/atngw100
Message-ID: <20071012151651.8465AA659B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-12 08:16:51 -0700 (Fri, 12 Oct 2007)
New Revision: 20234

Log:
Add JFFS partition info for NGW100

Added:
   trunk/buildroot/target/device/Atmel/atngw100/jffs2_partitions.txt


Changeset:
Added: trunk/buildroot/target/device/Atmel/atngw100/jffs2_partitions.txt
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/jffs2_partitions.txt	                        (rev 0)
+++ trunk/buildroot/target/device/Atmel/atngw100/jffs2_partitions.txt	2007-10-12 15:16:51 UTC (rev 20234)
@@ -0,0 +1,8 @@
+# Partition setup for ATNGW100.
+#
+# root is a 8 MB NOR flash.
+# usr is a 8 MB serial DataFlash.
+#
+# <mount point>		<mount name>	<page size>	<erase size>	<cleanmarkers>	<device file>	<pad size>
+/			root		0x1000		0x10000		1		1		0x0
+/usr			usr		0x420		0x2100		0		0		0x0
