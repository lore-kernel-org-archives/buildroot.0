From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 17 Jan 2007 02:07:02 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20070117100702.7746B48579@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-17 02:07:01 -0800 (Wed, 17 Jan 2007)
New Revision: 17333

Log:
- add short section about offline-builds


Modified:
   trunk/buildroot/docs/README


Changeset:
Modified: trunk/buildroot/docs/README
===================================================================
--- trunk/buildroot/docs/README	2007-01-17 00:48:32 UTC (rev 17332)
+++ trunk/buildroot/docs/README	2007-01-17 10:07:01 UTC (rev 17333)
@@ -13,6 +13,19 @@
 
  -Erik
 
+Offline build:
+==============
+
+In order to do an offline-build (not connected to the net), fetch all
+selected source by issuing a
+$ make source
+
+before you disconnect.
+If your build-host is never connected, then you have to copy buildroot
+and your toplevel .config to a machine that has an internet-connection
+and issue "make source" there, then copy the content of your dl/ dir to
+the build-host.
+
 More finegrained configuration:
 ===============================
 
