From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 30 Mar 2009 11:53:45 +0000 (UTC)
Subject: [Buildroot] svn commit: [25894] trunk/buildroot/package/ntfs-3g
Message-ID: <20090330115345.5D268775EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-30 11:53:45 +0000 (Mon, 30 Mar 2009)
New Revision: 25894

Log:
ntfs-3g: fix avr32 comment dependency (NTFS-3G, not NTFS_3G)

Modified:
   trunk/buildroot/package/ntfs-3g/Config.in


Changeset:
Modified: trunk/buildroot/package/ntfs-3g/Config.in
===================================================================
--- trunk/buildroot/package/ntfs-3g/Config.in	2009-03-30 11:53:40 UTC (rev 25893)
+++ trunk/buildroot/package/ntfs-3g/Config.in	2009-03-30 11:53:45 UTC (rev 25894)
@@ -1,5 +1,5 @@
 comment "ntfs-3g has no inherent support for AVR32"
-	depends on BR2_avr32 && BR2_PACKAGE_NTFS_3G
+	depends on BR2_avr32 && BR2_PACKAGE_NTFS-3G
 
 config BR2_PACKAGE_NTFS-3G
 	bool "ntfs-3g"
