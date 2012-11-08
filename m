From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  8 Nov 2012 10:09:59 +0100
Subject: [Buildroot] [PATCH 2/2] lm-sensors: bump to 3.3.3
In-Reply-To: <1352365799-27913-1-git-send-email-yegorslists@googlemail.com>
References: <1352365799-27913-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1352365799-27913-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/lm-sensors/lm-sensors.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index ba183ec..34aa742 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LM_SENSORS_VERSION = 3.3.2
+LM_SENSORS_VERSION = 3.3.3
 LM_SENSORS_SOURCE = lm_sensors-$(LM_SENSORS_VERSION).tar.bz2
 LM_SENSORS_SITE = http://dl.lm-sensors.org/lm-sensors/releases
 LM_SENSORS_INSTALL_STAGING = YES
-- 
1.7.7
