From: tpetazzoni at uclibc.org <tpetazzoni@uclibc.org>
Date: Wed,  3 Dec 2008 05:36:45 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/autoconf
Message-ID: <20081203133645.EBECF3C83E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: tpetazzoni
Date: 2008-12-03 05:36:45 -0800 (Wed, 03 Dec 2008)
New Revision: 24242

Log:
Fix comment about autoconf configuration/compilation/installation for
the target (and not the host).



Modified:
   trunk/buildroot/package/autoconf/autoconf.mk


Changeset:
Modified: trunk/buildroot/package/autoconf/autoconf.mk
===================================================================
--- trunk/buildroot/package/autoconf/autoconf.mk	2008-12-03 11:59:12 UTC (rev 24241)
+++ trunk/buildroot/package/autoconf/autoconf.mk	2008-12-03 13:36:45 UTC (rev 24242)
@@ -29,7 +29,7 @@
 
 #############################################################
 #
-# autoconf for the host
+# autoconf for the target
 #
 #############################################################
 
