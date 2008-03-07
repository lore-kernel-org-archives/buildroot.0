From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Fri,  7 Mar 2008 06:12:14 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: jamvm synergy
Message-ID: <20080307141214.8147E120188@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-07 06:12:14 -0800 (Fri, 07 Mar 2008)
New Revision: 21274

Log:
shortened help line lengths

Modified:
   trunk/buildroot/package/jamvm/Config.in
   trunk/buildroot/package/synergy/Config.in


Changeset:
Modified: trunk/buildroot/package/jamvm/Config.in
===================================================================
--- trunk/buildroot/package/jamvm/Config.in	2008-03-07 13:57:53 UTC (rev 21273)
+++ trunk/buildroot/package/jamvm/Config.in	2008-03-07 14:12:14 UTC (rev 21274)
@@ -4,8 +4,7 @@
         depends on BR2_PACKAGE_CLASSPATH
 
 	help
-	  JamVM is a new Java Virtual Machine which conforms to the JVM specification version 2 (blue book). 
-	  In comparison to most other VM's (free and commercial) it is extremely small, with a stripped executable on PowerPC of only ~180K, and Intel 150K. 
-	  However, unlike other small VMs (e.g. KVM) it is designed to support the full specification, and includes support for 
-	  object finalisation, Soft/Weak/Phantom References, class-unloading, the Java Native Interface (JNI) and the Reflection API. 
+	  JamVM is a new Java Virtual Machine which conforms to 
+	  the JVM specification version 2 (blue book). 
+
 	  http://jamvm.sourceforge.net/

Modified: trunk/buildroot/package/synergy/Config.in
===================================================================
--- trunk/buildroot/package/synergy/Config.in	2008-03-07 13:57:53 UTC (rev 21273)
+++ trunk/buildroot/package/synergy/Config.in	2008-03-07 14:12:14 UTC (rev 21274)
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_SYNERGY
 	bool "synergy"
 	default n
-	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
+	depends BR2_PACKAGE_XORG7
 	help
-	  Synergy lets you easily share a single mouse and keyboard between multiple computers with different operating systems, each with its own display, without special hardware.
+	  Synergy lets you easily share a single mouse and 
+	  keyboard between multiple computers with different 
+	  operating systems, each with its own display, 
+	  without special hardware.
 
 	  http://synergy2.sourceforge.net/
-
-comment "synergy		- disabled (requires Xorg(7))"
-	depends !(BR2_PACKAGE_XORG || BR2_PACKAGE_XORG7)
