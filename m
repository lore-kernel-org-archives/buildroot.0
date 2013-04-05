From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  5 Apr 2013 07:47:31 -0300
Subject: [Buildroot] [PATCH 1/2] lm_sensors: needs host-bison and host-flex
Message-ID: <1365158852-3979-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/f88461702cd2f249e5d28eeac26f5e4d9edece6d/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lm-sensors/lm-sensors.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index 3f95676..fcd278e 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -8,6 +8,7 @@ LM_SENSORS_VERSION = 3.3.3
 LM_SENSORS_SOURCE = lm_sensors-$(LM_SENSORS_VERSION).tar.bz2
 LM_SENSORS_SITE = http://dl.lm-sensors.org/lm-sensors/releases
 LM_SENSORS_INSTALL_STAGING = YES
+LM_SENSORS_DEPENDENCIES = host-bison host-flex
 LM_SENSORS_LICENSE = libsensors LGPLv2.1+, programs GPLv2+
 LM_SENSORS_LICENSE_FILES = COPYING.LGPL COPYING
 
-- 
1.8.1.5
