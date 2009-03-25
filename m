From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 25 Mar 2009 14:21:49 +0000 (UTC)
Subject: [Buildroot] svn commit: [25814]
	trunk/buildroot/package/wpa_supplicant
Message-ID: <20090325142149.EEF0C76A00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-25 14:21:49 +0000 (Wed, 25 Mar 2009)
New Revision: 25814

Log:
wpa_supplicant: bump version

Patch by Gustavo Zacarias <gustavo@zacarias.com.ar>, closes #213.

Modified:
   trunk/buildroot/package/wpa_supplicant/wpa_supplicant.mk


Changeset:
Modified: trunk/buildroot/package/wpa_supplicant/wpa_supplicant.mk
===================================================================
--- trunk/buildroot/package/wpa_supplicant/wpa_supplicant.mk	2009-03-25 03:55:53 UTC (rev 25813)
+++ trunk/buildroot/package/wpa_supplicant/wpa_supplicant.mk	2009-03-25 14:21:49 UTC (rev 25814)
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-WPA_SUPPLICANT_VERSION = 0.6.8
+WPA_SUPPLICANT_VERSION = 0.6.9
 WPA_SUPPLICANT_SOURCE = wpa_supplicant-$(WPA_SUPPLICANT_VERSION).tar.gz
 WPA_SUPPLICANT_SITE = http://hostap.epitest.fi/releases
 WPA_SUPPLICANT_LIBTOOL_PATCH = NO
