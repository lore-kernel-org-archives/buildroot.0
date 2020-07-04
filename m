From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat,  4 Jul 2020 07:42:48 -0300
Subject: [Buildroot] [PATCH] package/lm-sensors: bump version to 3-6-0
Message-ID: <20200704104248.12419-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also separate the fields in the hash file by two spaces.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/lm-sensors/lm-sensors.hash | 6 +++---
 package/lm-sensors/lm-sensors.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lm-sensors/lm-sensors.hash b/package/lm-sensors/lm-sensors.hash
index d41af2745fe0..0ca07b7e690d 100644
--- a/package/lm-sensors/lm-sensors.hash
+++ b/package/lm-sensors/lm-sensors.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256	f671c1d63a4cd8581b3a4a775fd7864a740b15ad046fe92038bcff5c5134d7e0	lm-sensors-3-5-0.tar.gz
-sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	COPYING
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING.LGPL
+sha256  0591f9fa0339f0d15e75326d0365871c2d4e2ed8aa1ff759b3a55d3734b7d197  lm-sensors-3-6-0.tar.gz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index f8059be47e76..a69ca6e2bf1c 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LM_SENSORS_VERSION = 3-5-0
+LM_SENSORS_VERSION = 3-6-0
 LM_SENSORS_SITE = $(call github,lm-sensors,lm-sensors,V$(LM_SENSORS_VERSION))
 LM_SENSORS_INSTALL_STAGING = YES
 LM_SENSORS_DEPENDENCIES = host-bison host-flex
-- 
2.17.1
