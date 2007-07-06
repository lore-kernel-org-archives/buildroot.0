From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Fri,  6 Jul 2007 04:42:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package/avahi
	package/dropbear toolchain
Message-ID: <20070706114203.053E2A608B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-06 04:42:03 -0700 (Fri, 06 Jul 2007)
New Revision: 19011

Log:
Get rid of leading whitespace to silence warnings from config system.


Modified:
   trunk/buildroot/package/avahi/Config.in
   trunk/buildroot/package/dropbear/Config.in
   trunk/buildroot/toolchain/Config.in


Changeset:
Modified: trunk/buildroot/package/avahi/Config.in
===================================================================
--- trunk/buildroot/package/avahi/Config.in	2007-07-06 11:41:27 UTC (rev 19010)
+++ trunk/buildroot/package/avahi/Config.in	2007-07-06 11:42:03 UTC (rev 19011)
@@ -8,7 +8,7 @@
 	  http://www.avahi.org/
 
 config BR2_PACKAGE_AVAHI_AUTOIPD
-	bool "  IPv4LL network address configuration daemon"
+	bool "IPv4LL network address configuration daemon"
 	default y
 	depends on BR2_PACKAGE_AVAHI
 	help
@@ -20,7 +20,7 @@
 	  lack a DHCP server.
 
 config BR2_PACKAGE_AVAHI_DAEMON
-	bool "  mDNS/DNS-SD daemon"
+	bool "mDNS/DNS-SD daemon"
 	default n
 	depends on BR2_PACKAGE_AVAHI
 	select BR2_PACKAGE_EXPAT

Modified: trunk/buildroot/package/dropbear/Config.in
===================================================================
--- trunk/buildroot/package/dropbear/Config.in	2007-07-06 11:41:27 UTC (rev 19010)
+++ trunk/buildroot/package/dropbear/Config.in	2007-07-06 11:42:03 UTC (rev 19011)
@@ -7,7 +7,7 @@
 	  http://matt.ucc.asn.au/dropbear/dropbear.html
 
 config BR2_PACKAGE_DROPBEAR_URANDOM
-	bool "  Use /dev/urandom (low entropy systems only)?"
+	bool "Use /dev/urandom (low entropy systems only)?"
 	default n
 	depends on BR2_PACKAGE_DROPBEAR
 	help

Modified: trunk/buildroot/toolchain/Config.in
===================================================================
--- trunk/buildroot/toolchain/Config.in	2007-07-06 11:41:27 UTC (rev 19010)
+++ trunk/buildroot/toolchain/Config.in	2007-07-06 11:42:03 UTC (rev 19011)
@@ -13,7 +13,7 @@
 
 config BR2_TOOLCHAIN_EXTERNAL
 	bool
-	prompt " External toolchain"
+	prompt "External toolchain"
 endchoice
 
 source "toolchain/Config.in.2"
