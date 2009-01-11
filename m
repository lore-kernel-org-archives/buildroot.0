From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 11 Jan 2009 20:13:49 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20090111201350.0183C76736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-11 20:13:49 +0000 (Sun, 11 Jan 2009)
New Revision: 24757

Log:
Update package/Config.in for irda-utils, fusion and linux-fusion

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2009-01-11 20:13:07 UTC (rev 24756)
+++ trunk/buildroot/package/Config.in	2009-01-11 20:13:49 UTC (rev 24757)
@@ -142,7 +142,7 @@
 source "package/haserl/Config.in"
 source "package/hostap/Config.in"
 source "package/ifplugd/Config.in"
-source "package/irda-utils/Config.in"
+#source "package/irda-utils/Config.in"
 source "package/iperf/Config.in"
 source "package/iproute2/Config.in"
 source "package/ipsec-tools/Config.in"
@@ -287,12 +287,12 @@
 source "package/directfb/Config.in"
 source "package/directfb-examples/Config.in"
 source "package/fbdump/Config.in"
-source "package/fusion/Config.in"
 source "package/imagemagick/Config.in"
 source "package/jpeg/Config.in"
 source "package/libart/Config.in"
 source "package/libpng/Config.in"
 source "package/libungif/Config.in"
+source "package/linux-fusion/Config.in"
 source "package/lite/Config.in"
 source "package/pixman/Config.in"
 source "package/sawman/Config.in"
