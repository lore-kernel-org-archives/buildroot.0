From: Julien Grossholtz <julien.grossholtz@openest.io>
Date: Mon,  9 Sep 2019 10:35:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/paho-c-mqtt: bump to version 1.3.1
Message-ID: <20190909083531.31343-1-julien.grossholtz@openest.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

paho-mqtt-c 1.3.1 is the latest stable release. The latest release
contains various bug fixes and adds TLS-PSK encryption support.

Release notes: https://github.com/eclipse/paho.mqtt.c/milestone/6?closed=1

Signed-off-by: Julien Grossholtz <julien.grossholtz@openest.io>
---
 package/paho-mqtt-c/paho-mqtt-c.hash | 2 +-
 package/paho-mqtt-c/paho-mqtt-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/paho-mqtt-c/paho-mqtt-c.hash b/package/paho-mqtt-c/paho-mqtt-c.hash
index 5171c8caa4..97b15d1320 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.hash
+++ b/package/paho-mqtt-c/paho-mqtt-c.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  87cf846b02dde6328b84832287d8725d91f12f41366eecb4d59eeda1d6c7efdf  paho-mqtt-c-1.3.0.tar.gz
+sha256  7b4eed66ae3df3613629139c0df28b16abfa4e0927bd17360027d936784aa55e  paho-mqtt-c-1.3.1.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
 sha256  44277b2bec6093e4ac313afec251a4de599d24c4e768f8574d95b13a9d2d97b5  epl-v10
diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index 6b4fc2be03..8772d73be0 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHO_MQTT_C_VERSION = 1.3.0
+PAHO_MQTT_C_VERSION = 1.3.1
 PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,v$(PAHO_MQTT_C_VERSION))
 PAHO_MQTT_C_LICENSE = EPL-1.0 or BSD-3-Clause
 PAHO_MQTT_C_LICENSE_FILES = epl-v10 edl-v10
-- 
2.21.0
