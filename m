From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  6 Oct 2008 02:11:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20081006091157.BA2213C664@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-06 02:11:57 -0700 (Mon, 06 Oct 2008)
New Revision: 23590

Log:
README: document out-of-tree build support

Modified:
   trunk/buildroot/docs/README


Changeset:
Modified: trunk/buildroot/docs/README
===================================================================
--- trunk/buildroot/docs/README	2008-10-06 08:56:48 UTC (rev 23589)
+++ trunk/buildroot/docs/README	2008-10-06 09:11:57 UTC (rev 23590)
@@ -26,6 +26,17 @@
 and issue "make source" there, then copy the content of your dl/ dir to
 the build-host.
 
+Building out-of-tree:
+=====================
+
+Buildroot supports building out of tree with a syntax similar
+to the Linux kernel. To use it, add O=<directory> to the
+make command line, E.G.:
+
+$ make O=/tmp/build
+
+And all the output files will be located under /tmp/build.
+
 More finegrained configuration:
 ===============================
 
