From: Julien Grossholtz <julien.grossholtz@openest.io>
Date: Mon, 31 Aug 2020 09:25:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: bump to version 1.3.5
Message-ID: <20200831072511.2006076-1-julien.grossholtz@openest.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a paho-mqtt-c maintainace release. It fixes some memory leaks as
well as a potential deadlock.

Signed-off-by: Julien Grossholtz <julien.grossholtz@openest.io>
---
 package/paho-mqtt-c/paho-mqtt-c.hash | 2 +-
 package/paho-mqtt-c/paho-mqtt-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/paho-mqtt-c/paho-mqtt-c.hash b/package/paho-mqtt-c/paho-mqtt-c.hash
index bbfa2da386..3c1a27084b 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.hash
+++ b/package/paho-mqtt-c/paho-mqtt-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  1ae9b657b693254ed0710350df3dcf5232d1f479409a52861b5e5bb5cc3da046  paho-mqtt-c-1.3.4.tar.gz
+sha256  996eef9e498519da79108f58a887a34abc50cd76770b19b0300b27783706c71f  paho-mqtt-c-1.3.5.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  epl-v20
 sha256  99d3a5c5cc2812f0593a85ec7c1b6dd83e8477b5090c01d9de0d49d49f367a4a  LICENSE
diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index 984c512bbc..e11f0687df 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHO_MQTT_C_VERSION = 1.3.4
+PAHO_MQTT_C_VERSION = 1.3.5
 PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,v$(PAHO_MQTT_C_VERSION))
 PAHO_MQTT_C_LICENSE = EPL-2.0 or BSD-3-Clause
 PAHO_MQTT_C_LICENSE_FILES = epl-v20 edl-v10 LICENSE
-- 
2.25.4
