From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jan 2012 13:51:26 -0300
Subject: [Buildroot] [PATCH 07/13] lm-sensors: bump to version 3.3.1 and fix
	pwmconfig install
In-Reply-To: <1327596692-30728-1-git-send-email-gustavo@zacarias.com.ar>
References: <1327596692-30728-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1327596692-30728-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
1.7.3.4
