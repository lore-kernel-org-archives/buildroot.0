From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Jun 2021 22:55:34 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/paho-mqtt-c:
 security bump to version 1.3.9
Message-ID: <20210609202608.CDDE88141E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f35d6dca65f1eafe601982c4118f373da424cec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Old security issue not fixed:
https://github.com/eclipse/paho.mqtt.c/issues/1084

https://github.com/eclipse/paho.mqtt.c/milestone/16?closed=1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9dad1ef144077b92a8524a3311b1d598a306fdfb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/paho-mqtt-c/paho-mqtt-c.hash | 2 +-
 package/paho-mqtt-c/paho-mqtt-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/paho-mqtt-c/paho-mqtt-c.hash b/package/paho-mqtt-c/paho-mqtt-c.hash
index 5223757f0f..4cdedfbf9a 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.hash
+++ b/package/paho-mqtt-c/paho-mqtt-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  4920ff685344cdb0272568bc4414dcf48fcdfc4a98c78b1f3ca49c38417bf391  paho-mqtt-c-1.3.8.tar.gz
+sha256  386c9b5fa1cf6d0d516db12d57fd8f6a410dd0fdc5e9a2da870aae437a2535ed  paho-mqtt-c-1.3.9.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  epl-v20
 sha256  bc0f3f447097eb82a29ad6c2f4929572bb548b6bd4c9e38fde1bf131a771b7a0  LICENSE
diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index b9b4f217fb..68b58f2e02 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHO_MQTT_C_VERSION = 1.3.8
+PAHO_MQTT_C_VERSION = 1.3.9
 PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,v$(PAHO_MQTT_C_VERSION))
 PAHO_MQTT_C_LICENSE = EPL-2.0 or BSD-3-Clause
 PAHO_MQTT_C_LICENSE_FILES = epl-v20 edl-v10 LICENSE
