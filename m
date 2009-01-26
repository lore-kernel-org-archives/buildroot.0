From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 26 Jan 2009 00:34:04 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package: argus bind dmraid
	kismet libeXosip2 ltra etc...
Message-ID: <20090126003405.2EE7776D28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-26 00:34:02 +0000 (Mon, 26 Jan 2009)
New Revision: 25041

Log:
Add help for packages without AVR32 support

Modified:
   trunk/buildroot/package/argus/Config.in
   trunk/buildroot/package/bind/Config.in
   trunk/buildroot/package/dmraid/Config.in
   trunk/buildroot/package/kismet/Config.in
   trunk/buildroot/package/libeXosip2/Config.in
   trunk/buildroot/package/ltrace/Config.in
   trunk/buildroot/package/ntfs-3g/Config.in
   trunk/buildroot/package/openntpd/Config.in
   trunk/buildroot/package/openvpn/Config.in
   trunk/buildroot/package/pciutils/Config.in
   trunk/buildroot/package/ruby/Config.in
   trunk/buildroot/package/smartmontools/Config.in
   trunk/buildroot/package/stunnel/Config.in
   trunk/buildroot/package/vtun/Config.in


Changeset:
Modified: trunk/buildroot/package/argus/Config.in
===================================================================
--- trunk/buildroot/package/argus/Config.in	2009-01-26 00:16:11 UTC (rev 25040)
+++ trunk/buildroot/package/argus/Config.in	2009-01-26 00:34:02 UTC (rev 25041)
@@ -1,3 +1,6 @@
+comment "argus has no inherent support for AVR32" 
+	depends on BR2_avr32 && BR2_PACKAGE_ARGUS
+
 config BR2_PACKAGE_ARGUS
 	bool "argus"
 	select BR2_PACKAGE_LIBPCAP

Modified: trunk/buildroot/package/bind/Config.in
===================================================================
--- trunk/buildroot/package/bind/Config.in	2009-01-26 00:16:11 UTC (rev 25040)
+++ trunk/buildroot/package/bind/Config.in	2009-01-26 00:34:02 UTC (rev 25041)
@@ -1,3 +1,6 @@
+comment "bind has no inherent support for AVR32" 
+	depends on BR2_avr32 && BR2_PACKAGE_BIND
+
 config BR2_PACKAGE_BIND
 	bool "bind"
 	help

Modified: trunk/buildroot/package/dmraid/Config.in
===================================================================
--- trunk/buildroot/package/dmraid/Config.in	2009-01-26 00:16:11 UTC (rev 25040)
+++ trunk/buildroot/package/dmraid/Config.in	2009-01-26 00:34:02 UTC (rev 25041)
@@ -1,3 +1,6 @@
+comment "dmraid has no inherent support for AVR32" 
+	depends on BR2_avr32 && BR2_PACKAGE_DMRAID
+
 config BR2_PACKAGE_DMRAID
 	bool "dmraid"
 	select BR2_PACKAGE_DM

Modified: trunk/buildroot/package/kismet/Config.in
===================================================================
--- trunk/buildroot/package/kismet/Config.in	2009-01-26 00:16:11 UTC (rev 25040)
+++ trunk/buildroot/package/kismet/Config.in	2009-01-26 00:34:02 UTC (rev 25041)
@@ -1,3 +1,6 @@
+comment "kismet has no inherent support for AVR32" 
+	depends on BR2_avr32 && BR2_PACKAGE_KISMET
+
 config BR2_PACKAGE_KISMET
 	bool "kismet"
 	select BR2_PACKAGE_NCURSES

Modified: trunk/buildroot/package/libeXosip2/Config.in
===================================================================
--- trunk/buildroot/package/libeXosip2/Config.in	2009-01-26 00:16:11 UTC (rev 25040)
+++ trunk/buildroot/package/libeXosip2/Config.in	2009-01-26 00:34:02 UTC (rev 25041)
@@ -1,3 +1,6 @@
+comment "libeXosip2 has no inherent support for AVR32" 
+	depends on BR2_avr32 && BR2_PACKAGE_LIBEXOSIP2
+
 config BR2_PACKAGE_LIBEXOSIP2
 	bool "libeXosip2"
 	select BR2_PACKAGE_LIBOSIP2

Modified: trunk/buildroot/package/ltrace/Config.in
===================================================================
--- trunk/buildroot/package/ltrace/Config.in	2009-01-26 00:16:11 UTC (rev 25040)
+++ trunk/buildroot/package/ltrace/Config.in	2009-01-26 00:34:02 UTC (rev 25041)
@@ -1,3 +1,6 @@
+comment "ltrace has no inherent support for AVR32" 
+	depends on BR2_avr32 && BR2_PACKAGE_LTRACE
+
 config BR2_PACKAGE_LTRACE
 	bool "ltrace"
 	#depends on BR2_LARGEFILE

Modified: trunk/buildroot/package/ntfs-3g/Config.in
===================================================================
--- trunk/buildroot/package/ntfs-3g/Config.in	2009-01-26 00:16:11 UTC (rev 25040)
+++ trunk/buildroot/package/ntfs-3g/Config.in	2009-01-26 00:34:02 UTC (rev 25041)
@@ -1,3 +1,6 @@
+comment "ntfs-3g has no inherent support for AVR32" 
+	depends on BR2_avr32 && BR2_PACKAGE_NTFS_3G
+
 config BR2_PACKAGE_NTFS-3G
         bool "ntfs-3g"
 	select BR2_PACKAGE_PKGCONFIG

Modified: trunk/buildroot/package/openntpd/Config.in
===================================================================
--- trunk/buildroot/package/openntpd/Config.in	2009-01-26 00:16:11 UTC (rev 25040)
+++ trunk/buildroot/package/openntpd/Config.in	2009-01-26 00:34:02 UTC (rev 25041)
@@ -1,3 +1,6 @@
+comment "OpenNTPD has no inherent support for AVR32" 
+	depends on BR2_avr32 && BR2_PACKAGE_OPENNTPD
+
 config BR2_PACKAGE_OPENNTPD
 	bool "OpenNTPD"
 	help

Modified: trunk/buildroot/package/openvpn/Config.in
===================================================================
--- trunk/buildroot/package/openvpn/Config.in	2009-01-26 00:16:11 UTC (rev 25040)
+++ trunk/buildroot/package/openvpn/Config.in	2009-01-26 00:34:02 UTC (rev 25041)
@@ -1,3 +1,6 @@
+comment "openvpn has no inherent support for AVR32" 
+	depends on BR2_avr32 && BR2_PACKAGE_OPENVPN
+
 config BR2_PACKAGE_OPENVPN
 	bool "openvpn"
 	select BR2_PACKAGE_LZO

Modified: trunk/buildroot/package/pciutils/Config.in
===================================================================
--- trunk/buildroot/package/pciutils/Config.in	2009-01-26 00:16:11 UTC (rev 25040)
+++ trunk/buildroot/package/pciutils/Config.in	2009-01-26 00:34:02 UTC (rev 25041)
@@ -1,3 +1,6 @@
+comment "pciutils has no inherent support for AVR32" 
+	depends on BR2_avr32 && BR2_PACKAGE_PCIUTILS
+
 config BR2_PACKAGE_PCIUTILS
 	bool "pciutils"
 	help

Modified: trunk/buildroot/package/ruby/Config.in
===================================================================
--- trunk/buildroot/package/ruby/Config.in	2009-01-26 00:16:11 UTC (rev 25040)
+++ trunk/buildroot/package/ruby/Config.in	2009-01-26 00:34:02 UTC (rev 25041)
@@ -1,3 +1,6 @@
+comment "ruby has no inherent support for AVR32" 
+	depends on BR2_avr32 && BR2_PACKAGE_RUBY
+
 config BR2_PACKAGE_RUBY
 	bool "ruby"
 	help

Modified: trunk/buildroot/package/smartmontools/Config.in
===================================================================
--- trunk/buildroot/package/smartmontools/Config.in	2009-01-26 00:16:11 UTC (rev 25040)
+++ trunk/buildroot/package/smartmontools/Config.in	2009-01-26 00:34:02 UTC (rev 25041)
@@ -1,3 +1,6 @@
+comment "smartmontools has no inherent support for AVR32" 
+	depends on BR2_avr32 && BR2_PACKAGE_SMARTMONTOOLS
+
 config BR2_PACKAGE_SMARTMONTOOLS
 	bool "smartmontools"
 	help

Modified: trunk/buildroot/package/stunnel/Config.in
===================================================================
--- trunk/buildroot/package/stunnel/Config.in	2009-01-26 00:16:11 UTC (rev 25040)
+++ trunk/buildroot/package/stunnel/Config.in	2009-01-26 00:34:02 UTC (rev 25041)
@@ -1,3 +1,6 @@
+comment "stunnel has no inherent support for AVR32" 
+	depends on BR2_avr32 && BR2_PACKAGE_STUNNEL
+
 config BR2_PACKAGE_STUNNEL
 	bool "stunnel"
 	help

Modified: trunk/buildroot/package/vtun/Config.in
===================================================================
--- trunk/buildroot/package/vtun/Config.in	2009-01-26 00:16:11 UTC (rev 25040)
+++ trunk/buildroot/package/vtun/Config.in	2009-01-26 00:34:02 UTC (rev 25041)
@@ -1,3 +1,6 @@
+comment "vtun has no inherent support for AVR32" 
+	depends on BR2_avr32 && BR2_PACKAGE_VTUN
+
 config BR2_PACKAGE_VTUN
 	bool "vtun - BEWARE: read package/vtun/README.txt before use"
 	select BR2_PACKAGE_LZO
