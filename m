From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 13:18:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/kismet
Message-ID: <20080827201851.8D2683C83D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 13:18:51 -0700 (Wed, 27 Aug 2008)
New Revision: 23251

Log:
kismet: fix long help text lines

And add homepage while we're at it.

Modified:
   trunk/buildroot/package/kismet/Config.in


Changeset:
Modified: trunk/buildroot/package/kismet/Config.in
===================================================================
--- trunk/buildroot/package/kismet/Config.in	2008-08-27 20:18:43 UTC (rev 23250)
+++ trunk/buildroot/package/kismet/Config.in	2008-08-27 20:18:51 UTC (rev 23251)
@@ -4,14 +4,17 @@
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
-
 	help
-		Kismet - 802.11 layer2 wireless network detector, sniffer, and intrusion detection system
+	  Kismet - 802.11 layer2 wireless network detector, sniffer,
+	  and intrusion detection system.
 
-		Kismet will work with any wireless card which supports raw monitoring (rfmon) mode, and can
-		sniff 802.11b, 802.11a, and 802.11g traffic.
-		
-		Kismet identifies networks by passively collecting packets and detecting standard named
-		networks, detecting (and given time, decloaking) hidden networks, and infering the presence
-		of nonbeaconing networks via data traffic.
+	  Kismet will work with any wireless card which supports raw
+	  monitoring (rfmon) mode, and can sniff 802.11b, 802.11a, and
+	  802.11g traffic.
 
+	  Kismet identifies networks by passively collecting packets
+	  and detecting standard named networks, detecting (and given
+	  time, decloaking) hidden networks, and infering the presence
+	  of nonbeaconing networks via data traffic.
+
+	  http://www.kismetwireless.net
