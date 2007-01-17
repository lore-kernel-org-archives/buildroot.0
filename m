From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 17 Jan 2007 04:31:16 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070117123116.8B25C4859A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-17 04:31:15 -0800 (Wed, 17 Jan 2007)
New Revision: 17340

Log:
- put haserl into the networking section


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-01-17 12:28:23 UTC (rev 17339)
+++ trunk/buildroot/package/Config.in	2007-01-17 12:31:15 UTC (rev 17340)
@@ -63,7 +63,6 @@
 source "package/mpfr/Config.in"
 source "package/gzip/Config.in"
 source "package/hal/Config.in"
-source "package/haserl/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/hdparm/Config.in"
 source "package/hotplug/Config.in"
@@ -181,6 +180,7 @@
 source "package/dnsmasq/Config.in"
 source "package/dropbear/Config.in"
 source "package/ethtool/Config.in"
+source "package/haserl/Config.in"
 source "package/hostap/Config.in"
 source "package/iproute2/Config.in"
 source "package/ipsec-tools/Config.in"
