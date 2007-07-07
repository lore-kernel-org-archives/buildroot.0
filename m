From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  7 Jul 2007 11:17:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/config
Message-ID: <20070707181741.E750EA65A0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-07 11:17:41 -0700 (Sat, 07 Jul 2007)
New Revision: 19022

Log:
- mention from which version this copy of kconfig comes from (redundant since i noted it already in the checkin message, but ok).


Modified:
   trunk/buildroot/package/config/README.buildroot2


Changeset:
Modified: trunk/buildroot/package/config/README.buildroot2
===================================================================
--- trunk/buildroot/package/config/README.buildroot2	2007-07-07 12:58:15 UTC (rev 19021)
+++ trunk/buildroot/package/config/README.buildroot2	2007-07-07 18:17:41 UTC (rev 19022)
@@ -1,4 +1,5 @@
-This is a copy of the kconfig code in the kernel tweaked to suit Buildroot.
+This is a copy of the kconfig code in the kernel (currently 2.6.21.5) tweaked to
+suit Buildroot.
 
 To update:
 	cp -r /usr/src/linux/scripts/kconfig package/config.new
