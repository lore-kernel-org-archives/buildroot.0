From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 13 Dec 2006 12:26:27 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/x86/i386
Message-ID: <20061213202627.2C45D4857C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-13 12:26:27 -0800 (Wed, 13 Dec 2006)
New Revision: 16906

Log:
- remove BR2_PACKAGE_BUSYBOX_CONFIG from here since we already have a default for it in busybox/Config.in


Modified:
   trunk/buildroot/target/device/x86/i386/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/x86/i386/Makefile.in
===================================================================
--- trunk/buildroot/target/device/x86/i386/Makefile.in	2006-12-13 20:09:07 UTC (rev 16905)
+++ trunk/buildroot/target/device/x86/i386/Makefile.in	2006-12-13 20:26:27 UTC (rev 16906)
@@ -1,5 +1,3 @@
 X86_I386_PATH=target/device/x86/i386
 
-BR2_PACKAGE_BUSYBOX_CONFIG=$(X86_I386_PATH)/busybox.config
-
 TARGETS+=linux26
