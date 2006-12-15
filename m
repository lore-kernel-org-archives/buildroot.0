From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 15 Dec 2006 06:37:02 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20061215143702.D709D4858A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-15 06:37:02 -0800 (Fri, 15 Dec 2006)
New Revision: 16945

Log:
- pull bsdiff's Config in


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2006-12-15 14:18:30 UTC (rev 16944)
+++ trunk/buildroot/package/Config.in	2006-12-15 14:37:02 UTC (rev 16945)
@@ -35,6 +35,7 @@
 source "package/bison/Config.in"
 source "package/boa/Config.in"
 source "package/bridge/Config.in"
+source "package/bsdiff/Config.in"
 source "package/customize/Config.in"
 source "package/dhcp/Config.in"
 source "package/dialog/Config.in"
