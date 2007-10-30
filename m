From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 30 Oct 2007 14:37:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lm-sensors
Message-ID: <20071030213739.727C2A4B70@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-30 14:37:39 -0700 (Tue, 30 Oct 2007)
New Revision: 20339

Log:
Fix patch version for lm-sensors

Modified:
   trunk/buildroot/package/lm-sensors/lm-sensors.mk


Changeset:
Modified: trunk/buildroot/package/lm-sensors/lm-sensors.mk
===================================================================
--- trunk/buildroot/package/lm-sensors/lm-sensors.mk	2007-10-30 21:32:09 UTC (rev 20338)
+++ trunk/buildroot/package/lm-sensors/lm-sensors.mk	2007-10-30 21:37:39 UTC (rev 20339)
@@ -5,7 +5,7 @@
 #############################################################
 LM_SENSORS_VERSION:=2.10.4
 LM_SENSORS_SOURCE:=lm-sensors_$(LM_SENSORS_VERSION).orig.tar.gz
-LM_SENSORS_PATCH:=lm-sensors_$(LM_SENSORS_VERSION)-1.diff.gz
+LM_SENSORS_PATCH:=lm-sensors_$(LM_SENSORS_VERSION)-3.diff.gz
 LM_SENSORS_SITE:=http://ftp.debian.org/debian/pool/main/l/lm-sensors/
 LM_SENSORS_DIR:=$(BUILD_DIR)/lm_sensors-$(LM_SENSORS_VERSION)
 LM_SENSORS_CAT:=$(ZCAT)
