From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 12 Aug 2007 16:36:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gettext
Message-ID: <20070812233627.5ABB5A6859@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-12 16:36:27 -0700 (Sun, 12 Aug 2007)
New Revision: 19478

Log:
Use shared library for gettext as default

Modified:
   trunk/buildroot/package/gettext/Config.in


Changeset:
Modified: trunk/buildroot/package/gettext/Config.in
===================================================================
--- trunk/buildroot/package/gettext/Config.in	2007-08-12 23:35:20 UTC (rev 19477)
+++ trunk/buildroot/package/gettext/Config.in	2007-08-12 23:36:27 UTC (rev 19478)
@@ -10,7 +10,7 @@
 
 config BR2_PACKAGE_GETTEXT_STATIC
 	bool "Use libgettext.a instead of libgettext.so.*"
-	default y
+	default n
 	depends on BR2_PACKAGE_GETTEXT
 	depends on BR2_arm
 	help
