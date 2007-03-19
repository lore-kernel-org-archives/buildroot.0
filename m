From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 19 Mar 2007 03:49:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target
Message-ID: <20070319104912.046C848083@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-19 03:49:11 -0700 (Mon, 19 Mar 2007)
New Revision: 18157

Log:
- pin LINUX_VERSION. Closes #1277


Modified:
   trunk/buildroot/target/linux26.mk


Changeset:
Modified: trunk/buildroot/target/linux26.mk
===================================================================
--- trunk/buildroot/target/linux26.mk	2007-03-19 09:59:50 UTC (rev 18156)
+++ trunk/buildroot/target/linux26.mk	2007-03-19 10:49:11 UTC (rev 18157)
@@ -41,7 +41,7 @@
 LINUX26_DIR=$(BUILD_DIR)/linux-$(LINUX26_VERSION)
 
 # for packages that need it
-LINUX_VERSION=$(LINUX_VERSION)
+LINUX_VERSION:=$(LINUX_VERSION)
 LINUX_DIR=$(LINUX26_DIR)
 LINUX_KERNEL=$(LINUX26_KERNEL)
 
