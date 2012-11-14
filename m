From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:34:20 +0100
Subject: [Buildroot] [git commit] lm-sensors: add license info
Message-ID: <20121114214728.ADDF499B26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=56f14aac04e1705c00313f9ef177c9cf820265de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lm-sensors/lm-sensors.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index 34aa742..3f95676 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -8,6 +8,8 @@ LM_SENSORS_VERSION = 3.3.3
 LM_SENSORS_SOURCE = lm_sensors-$(LM_SENSORS_VERSION).tar.bz2
 LM_SENSORS_SITE = http://dl.lm-sensors.org/lm-sensors/releases
 LM_SENSORS_INSTALL_STAGING = YES
+LM_SENSORS_LICENSE = libsensors LGPLv2.1+, programs GPLv2+
+LM_SENSORS_LICENSE_FILES = COPYING.LGPL COPYING
 
 LM_SENSORS_BINS_ = bin/sensors-conf-convert
 LM_SENSORS_BINS_$(BR2_PACKAGE_LM_SENSORS_SENSORS) += bin/sensors
