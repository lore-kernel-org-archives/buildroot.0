From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 30 Oct 2012 22:36:46 +0100
Subject: [Buildroot] [git commit] lm-sensors: bump to 3.3.2
Message-ID: <20121030213943.35C9399983@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=77f3b71ef65ed3d54e4f4624f976de6627f7a6a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lm-sensors/lm-sensors.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index b596d44..ba183ec 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LM_SENSORS_VERSION = 3.3.1
+LM_SENSORS_VERSION = 3.3.2
 LM_SENSORS_SOURCE = lm_sensors-$(LM_SENSORS_VERSION).tar.bz2
 LM_SENSORS_SITE = http://dl.lm-sensors.org/lm-sensors/releases
 LM_SENSORS_INSTALL_STAGING = YES
