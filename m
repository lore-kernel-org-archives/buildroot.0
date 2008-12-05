From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Fri,  5 Dec 2008 01:46:17 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/alsa-lib
Message-ID: <20081205094618.0E0D43C8AC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-05 01:46:17 -0800 (Fri, 05 Dec 2008)
New Revision: 24280

Log:
alsa-lib: bump version to 1.0.18



Modified:
   trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk


Changeset:
Modified: trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk
===================================================================
--- trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk	2008-12-04 20:09:13 UTC (rev 24279)
+++ trunk/buildroot/package/multimedia/alsa-lib/alsa-lib.mk	2008-12-05 09:46:17 UTC (rev 24280)
@@ -3,7 +3,7 @@
 # alsa-lib
 #
 #############################################################
-ALSA_LIB_VERSION:=1.0.14a
+ALSA_LIB_VERSION:=1.0.18
 ALSA_LIB_SOURCE:=alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE:=ftp://ftp.alsa-project.org/pub/lib
 ALSA_LIB_DIR:=$(BUILD_DIR)/alsa-lib-$(ALSA_LIB_VERSION)
