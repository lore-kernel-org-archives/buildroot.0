From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  2 Jun 2013 20:28:41 -0300
Subject: [Buildroot] [PATCH 2/2] lm_sensors: bump to version 3.3.4
In-Reply-To: <1370215721-6766-1-git-send-email-gustavo@zacarias.com.ar>
References: <1370215721-6766-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1370215721-6766-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lm-sensors/lm-sensors.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index fcd278e..b4339a3 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LM_SENSORS_VERSION = 3.3.3
+LM_SENSORS_VERSION = 3.3.4
 LM_SENSORS_SOURCE = lm_sensors-$(LM_SENSORS_VERSION).tar.bz2
 LM_SENSORS_SITE = http://dl.lm-sensors.org/lm-sensors/releases
 LM_SENSORS_INSTALL_STAGING = YES
-- 
1.8.1.5
