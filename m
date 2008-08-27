From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 13:19:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openmotif
Message-ID: <20080827201922.BC6A3F8019@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 13:19:22 -0700 (Wed, 27 Aug 2008)
New Revision: 23260

Log:
openmotif: fix long help text lines

Modified:
   trunk/buildroot/package/openmotif/Config.in


Changeset:
Modified: trunk/buildroot/package/openmotif/Config.in
===================================================================
--- trunk/buildroot/package/openmotif/Config.in	2008-08-27 20:19:19 UTC (rev 23259)
+++ trunk/buildroot/package/openmotif/Config.in	2008-08-27 20:19:22 UTC (rev 23260)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_OPENMOTIF
 	bool "openmotif"
 	help
-	  OpenMotif is the publicly licensed version of Motif, the industry standard user interface toolkit for UNIX systems.
+	  OpenMotif is the publicly licensed version of Motif, the
+	  industry standard user interface toolkit for UNIX systems.
 
 	  ftp://ftp.ics.com/openmotif/2.3/2.3.0
