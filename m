From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Jan 2012 22:23:00 +0100
Subject: [Buildroot] [git commit] lm-sensors: bump to version 3.3.1 and fix
	pwmconfig install
Message-ID: <20120126212542.505ED9058C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=008f2c205090c1fde8c3646f2b104da7d02648d2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lm-sensors/lm-sensors.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index 99a8e3b..a351329 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -3,7 +3,8 @@
 # lm-sensors
 #
 #############################################################
-LM_SENSORS_VERSION = 3.2.0
+
+LM_SENSORS_VERSION = 3.3.1
 LM_SENSORS_SOURCE = lm_sensors-$(LM_SENSORS_VERSION).tar.bz2
 LM_SENSORS_SITE = http://dl.lm-sensors.org/lm-sensors/releases
 LM_SENSORS_INSTALL_STAGING = YES
@@ -13,6 +14,7 @@ LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_SENSORS) += bin/sensors
 LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_FANCONTROL) += sbin/fancontrol
 LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_ISADUMP) += sbin/isadump
 LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_ISASET) += sbin/isaset
+LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_PWMCONFIG) += sbin/pwmconfig
 LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_SENSORS_DETECT) += sbin/sensors-detect
 
 define LM_SENSORS_BUILD_CMDS
