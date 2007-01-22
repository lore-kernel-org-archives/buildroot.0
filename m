From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 22 Jan 2007 11:33:58 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070122193358.DBE5648599@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-22 11:33:58 -0800 (Mon, 22 Jan 2007)
New Revision: 17475

Log:
- remove erroneously leaked in inclusion of non-existing l2tp thing


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-01-22 19:22:55 UTC (rev 17474)
+++ trunk/buildroot/package/Config.in	2007-01-22 19:33:58 UTC (rev 17475)
@@ -131,7 +131,6 @@
 source "package/iproute2/Config.in"
 source "package/ipsec-tools/Config.in"
 source "package/iptables/Config.in"
-source "package/l2tp/Config.in"
 source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
 source "package/libpcap/Config.in"
