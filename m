From: wberrier at uclibc.org <wberrier@uclibc.org>
Date: Mon,  6 Oct 2008 13:28:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/ccache
Message-ID: <20081006202846.5EF953C80D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: wberrier
Date: 2008-10-06 13:28:46 -0700 (Mon, 06 Oct 2008)
New Revision: 23609

Log:
ccache:
-Don't show custom location dir if ccache isn't selected.


Modified:
   trunk/buildroot/toolchain/ccache/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/ccache/Config.in
===================================================================
--- trunk/buildroot/toolchain/ccache/Config.in	2008-10-06 19:54:58 UTC (rev 23608)
+++ trunk/buildroot/toolchain/ccache/Config.in	2008-10-06 20:28:46 UTC (rev 23609)
@@ -14,6 +14,3 @@
 	help
 	    Where ccache should store cached files.
 
-comment "ccache dir location?       - disabled (requires ccache support)"
-	depends on !BR2_CCACHE
-
