From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 20 Mar 2007 02:52:37 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/x86/i386
Message-ID: <20070320095237.102A54801D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-20 02:52:36 -0700 (Tue, 20 Mar 2007)
New Revision: 18174

Log:
- disable compile-broken EDAC_I82875P driver


Modified:
   trunk/buildroot/target/device/x86/i386/linux26.config


Changeset:
Modified: trunk/buildroot/target/device/x86/i386/linux26.config
===================================================================
--- trunk/buildroot/target/device/x86/i386/linux26.config	2007-03-20 09:51:37 UTC (rev 18173)
+++ trunk/buildroot/target/device/x86/i386/linux26.config	2007-03-20 09:52:36 UTC (rev 18174)
@@ -1563,7 +1563,7 @@
 CONFIG_EDAC_MM_EDAC=m
 CONFIG_EDAC_AMD76X=m
 CONFIG_EDAC_E7XXX=m
-CONFIG_EDAC_I82875P=m
+# CONFIG_EDAC_I82875P is not set
 CONFIG_EDAC_I82860=m
 CONFIG_EDAC_R82600=m
 CONFIG_EDAC_POLL=y
