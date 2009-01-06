From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  6 Jan 2009 16:13:09 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot/2009.01-rc1
Message-ID: <20090106161309.43C0E76BFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-06 16:13:08 +0000 (Tue, 06 Jan 2009)
New Revision: 24701

Log:
Remove an extra #endif from u-boot.factory

Modified:
   trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-009-factory.patch


Changeset:
Modified: trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-009-factory.patch
===================================================================
--- trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-009-factory.patch	2009-01-06 16:10:56 UTC (rev 24700)
+++ trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-009-factory.patch	2009-01-06 16:13:08 UTC (rev 24701)
@@ -309,7 +309,7 @@
 +);
 +#endif /* #if	defined(CONFIG_LOAD_SCRIPTS) */
 +
-+#endif	/* CONFIG_DEFENV */
++
 diff -urN u-boot-2009.01-0rig//common/Makefile u-boot-2009.01/common/Makefile
 --- u-boot-2009.01-0rig//common/Makefile	2008-12-16 23:48:27.000000000 +0100
 +++ u-boot-2009.01/common/Makefile	2009-01-02 19:17:16.000000000 +0100
