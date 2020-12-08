From: Julien Grossholtz <julien.grossholtz@openest.io>
Date: Tue,  8 Dec 2020 15:13:41 +0100
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: bump to version 1.3.7
Message-ID: <20201208141341.3990069-1-julien.grossholtz@openest.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paho-mqtt-c maintainance release. It fixes some bugs including client
times out and buffer overflow:

https://github.com/eclipse/paho.mqtt.c/milestone/9?closed=1
Signed-off-by: Julien Grossholtz <julien.grossholtz@openest.io>
---
 package/paho-mqtt-c/paho-mqtt-c.hash | 2 +-
 package/paho-mqtt-c/paho-mqtt-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/paho-mqtt-c/paho-mqtt-c.hash b/package/paho-mqtt-c/paho-mqtt-c.hash
index 4d9939af31..93ce1b34f2 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.hash
+++ b/package/paho-mqtt-c/paho-mqtt-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  ecbc2c2000c6d8dcf1a76325312c61ed29db0b010acbd40cb92fcd4c014cd017  paho-mqtt-c-1.3.6.tar.gz
+sha256  19e9f04ddf244ab8c937d7e631ca15cedce7df95712c554107600e80efdaf277  paho-mqtt-c-1.3.7.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  epl-v20
 sha256  bc0f3f447097eb82a29ad6c2f4929572bb548b6bd4c9e38fde1bf131a771b7a0  LICENSE
diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index 3ac46397dd..a477c8baaa 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHO_MQTT_C_VERSION = 1.3.6
+PAHO_MQTT_C_VERSION = 1.3.7
 PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,v$(PAHO_MQTT_C_VERSION))
 PAHO_MQTT_C_LICENSE = EPL-2.0 or BSD-3-Clause
 PAHO_MQTT_C_LICENSE_FILES = epl-v20 edl-v10 LICENSE
-- 
2.25.4
