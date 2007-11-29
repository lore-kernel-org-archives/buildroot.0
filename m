From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Thu, 29 Nov 2007 05:30:19 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/alsa-utils
Message-ID: <20071129133019.81B5E30082@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-11-29 05:30:17 -0800 (Thu, 29 Nov 2007)
New Revision: 20590

Log:
aplay depends on BR2_LARGEFILE support

Modified:
   trunk/buildroot/package/alsa-utils/Config.in


Changeset:
Modified: trunk/buildroot/package/alsa-utils/Config.in
===================================================================
--- trunk/buildroot/package/alsa-utils/Config.in	2007-11-29 13:06:42 UTC (rev 20589)
+++ trunk/buildroot/package/alsa-utils/Config.in	2007-11-29 13:30:17 UTC (rev 20590)
@@ -44,6 +44,7 @@
 config BR2_PACKAGE_ALSA_UTILS_APLAY
 	bool "aplay"
 	default n
+	select BR2_LARGEFILE
 	depends on BR2_PACKAGE_ALSA_UTILS
 
 config BR2_PACKAGE_ALSA_UTILS_ARECORD
