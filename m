From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sun, 14 Oct 2007 00:39:03 +0300
Subject: [Buildroot] PATCH: lm-sensors - correct patch version
Message-ID: <47113AF7.1050704@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lm-sensors - correct patch version, now download&build successful:

Index: package/lm-sensors/lm-sensors.mk
===================================================================
--- package/lm-sensors/lm-sensors.mk    (revision 20237)
+++ package/lm-sensors/lm-sensors.mk    (working copy)
@@ -5,7 +5,7 @@
 #############################################################
 LM_SENSORS_VERSION:=2.10.4
 LM_SENSORS_SOURCE:=lm-sensors_$(LM_SENSORS_VERSION).orig.tar.gz
-LM_SENSORS_PATCH:=lm-sensors_$(LM_SENSORS_VERSION)-1.diff.gz
+LM_SENSORS_PATCH:=lm-sensors_$(LM_SENSORS_VERSION)-3.diff.gz
 LM_SENSORS_SITE:=http://ftp.debian.org/debian/pool/main/l/lm-sensors/
 LM_SENSORS_DIR:=$(BUILD_DIR)/lm_sensors-$(LM_SENSORS_VERSION)
 LM_SENSORS_CAT:=$(ZCAT)


Best regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
