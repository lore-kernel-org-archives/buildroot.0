From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jan 2016 08:37:03 +0100
Subject: [Buildroot] [git commit] package/lm-sensors: bump version to 3.4.0
Message-ID: <20160201224703.82A297F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47a142f6662eb983d0325ccabea4dcda4fdd667f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lm-sensors/lm-sensors.hash | 4 ++--
 package/lm-sensors/lm-sensors.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lm-sensors/lm-sensors.hash b/package/lm-sensors/lm-sensors.hash
index 05fd5ca..8cbd3d1 100644
--- a/package/lm-sensors/lm-sensors.hash
+++ b/package/lm-sensors/lm-sensors.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	5dae6a665e1150159a93743c4ff1943a7efe02cd9d3bb12c4805e7d7adcf4fcf	lm_sensors-3.3.5.tar.bz2
+# Locally calculated
+sha256	e0579016081a262dd23eafe1d22b41ebde78921e73a1dcef71e05e424340061f	lm_sensors-3.4.0.tar.bz2
diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index cc05ef4..d2080d8 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LM_SENSORS_VERSION = 3.3.5
+LM_SENSORS_VERSION = 3.4.0
 LM_SENSORS_SOURCE = lm_sensors-$(LM_SENSORS_VERSION).tar.bz2
 LM_SENSORS_SITE = ftp://ftp.netroedge.com/pub/lm-sensors
 LM_SENSORS_INSTALL_STAGING = YES
