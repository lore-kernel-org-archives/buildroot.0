From: andersen at uclibc.org <andersen@uclibc.org>
Date: Mon, 15 Jan 2007 14:37:08 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070115223708.3D0C048596@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2007-01-15 14:37:08 -0800 (Mon, 15 Jan 2007)
New Revision: 17320

Log:
missed a spot -- need to add metacity here as well.  We really should add some
categories in here.  Things are getting a bit messy just shoving everything in
with no ordering.


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-01-15 22:34:53 UTC (rev 17319)
+++ trunk/buildroot/package/Config.in	2007-01-15 22:37:08 UTC (rev 17320)
@@ -106,6 +106,7 @@
 source "package/m4/Config.in"
 source "package/mdadm/Config.in"
 source "package/memtester/Config.in"
+source "package/metacity/Config.in"
 source "package/microcom/Config.in"
 source "package/microperl/Config.in"
 source "package/microwin/Config.in"
