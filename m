From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 25 Nov 2007 15:30:30 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dbus
Message-ID: <20071125233030.8DA2E30045@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-25 15:30:29 -0800 (Sun, 25 Nov 2007)
New Revision: 20534

Log:
Fix syntax error in dbus

Modified:
   trunk/buildroot/package/dbus/Config.in


Changeset:
Modified: trunk/buildroot/package/dbus/Config.in
===================================================================
--- trunk/buildroot/package/dbus/Config.in	2007-11-25 14:49:45 UTC (rev 20533)
+++ trunk/buildroot/package/dbus/Config.in	2007-11-25 23:30:29 UTC (rev 20534)
@@ -7,7 +7,7 @@
 
 	  http://www.freedesktop.org/wiki/Software/dbus
 
-comment "dbus not available (need expat or libxml2)
+comment "dbus not available (need expat or libxml2)"
 	depends on !BR2_PACKAGE_EXPAT && !BR2_PACKAGE_LIBXML2
 
 choice
