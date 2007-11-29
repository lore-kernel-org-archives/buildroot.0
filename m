From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Nov 2007 05:02:38 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libxslt
Message-ID: <20071129130238.B02D930048@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-29 05:02:38 -0800 (Thu, 29 Nov 2007)
New Revision: 20584

Log:
Make libxslt depend on packets, instead of selecting them

Modified:
   trunk/buildroot/package/libxslt/Config.in


Changeset:
Modified: trunk/buildroot/package/libxslt/Config.in
===================================================================
--- trunk/buildroot/package/libxslt/Config.in	2007-11-29 13:02:10 UTC (rev 20583)
+++ trunk/buildroot/package/libxslt/Config.in	2007-11-29 13:02:38 UTC (rev 20584)
@@ -16,6 +16,6 @@
 
 	  http://www.w3.org/TR/xslt
 
-comment "libxslt disabled (requires pkgconfig)"
+comment "libxslt	- disabled (requires pkgconfig)"
 	depends !BR2_PACKAGE_PKGCONFIG
 
