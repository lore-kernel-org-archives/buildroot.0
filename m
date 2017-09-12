From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 12 Sep 2017 15:04:15 +0200
Subject: [Buildroot] [PATCH] paho-mqtt-c: bump to version 1.2.0
Message-ID: <20170912130415.14281-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/paho-mqtt-c/paho-mqtt-c.hash | 2 +-
 package/paho-mqtt-c/paho-mqtt-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/paho-mqtt-c/paho-mqtt-c.hash b/package/paho-mqtt-c/paho-mqtt-c.hash
index 8807d788a3..5fda80abaa 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.hash
+++ b/package/paho-mqtt-c/paho-mqtt-c.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  970b9621efc24251441d386274cd0a90cf6ad52b64031f3c8cb53fdd5526f5f3  paho-mqtt-c-v1.1.0.tar.gz
+sha256  0cb0396554ebe0e8ac6b0de1cbc16601ef169b6a63baf6f0f3ddeb405f5471a5  paho-mqtt-c-v1.2.0.tar.gz
diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index 22ef2effac..5df7a55c62 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHO_MQTT_C_VERSION = v1.1.0
+PAHO_MQTT_C_VERSION = v1.2.0
 PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,$(PAHO_MQTT_C_VERSION))
 PAHO_MQTT_C_LICENSE = EPL-1.0 or BSD-3-Clause
 PAHO_MQTT_C_LICENSE_FILES = epl-v10 edl-v10
-- 
2.11.0
