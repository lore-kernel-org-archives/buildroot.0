From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 16:01:08 +0200
Subject: [Buildroot] [git commit] lm_sensors: needs host-bison and host-flex
Message-ID: <20130411140827.506EE9B586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=316aaf97575b226bbd86560fa097841d4805b032
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/f88461702cd2f249e5d28eeac26f5e4d9edece6d/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lm-sensors/lm-sensors.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
 
