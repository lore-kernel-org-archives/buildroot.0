From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  2 Dec 2006 09:03:38 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20061202170338.0003F485BF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-02 09:03:38 -0800 (Sat, 02 Dec 2006)
New Revision: 16753

Log:
- name the default busybox config-file.


Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2006-12-02 06:48:22 UTC (rev 16752)
+++ trunk/buildroot/package/busybox/Config.in	2006-12-02 17:03:38 UTC (rev 16753)
@@ -39,4 +39,5 @@
 	  Some people may wish to use their own modified BusyBox configuration
 	  file, and will specify their config file location with this option.
 
+	  The default is "package/busybox/busybox.config".
 	  Most people will just use the default BusyBox configuration file.
