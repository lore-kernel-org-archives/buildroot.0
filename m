From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Jan 2011 21:23:00 +0100
Subject: [Buildroot] [git commit master 1/1] lm-sensors: bump to version
	3.2.0
Message-ID: <20110117202411.C39287FD21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0ef1dde7db88ef1e5e0c6d7ee27e825c8faf9e25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lm-sensors/lm-sensors.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
index 9543d2e..eec969d 100644
--- a/package/lm-sensors/lm-sensors.mk
+++ b/package/lm-sensors/lm-sensors.mk
@@ -3,7 +3,7 @@
 # lm-sensors
 #
 #############################################################
-LM_SENSORS_VERSION = 3.1.2
+LM_SENSORS_VERSION = 3.2.0
 LM_SENSORS_SOURCE = lm_sensors-$(LM_SENSORS_VERSION).tar.bz2
 LM_SENSORS_SITE = http://dl.lm-sensors.org/lm-sensors/releases
 LM_SENSORS_INSTALL_STAGING = YES
-- 
1.7.3.4
