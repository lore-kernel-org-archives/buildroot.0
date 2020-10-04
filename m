From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2020 11:21:27 +0200
Subject: [Buildroot] [git commit] package/paho-mqtt-c: bump to version 1.3.6
Message-ID: <20201004094312.4D8E58D696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6eba48124efef25ffc97284d5308124bd087d865
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update LICENSE hash, EDL version has been fixed with
https://github.com/eclipse/paho.mqtt.c/commit/34ec96cac554c4ae1527b92433730233f1bdca40

https://github.com/eclipse/paho.mqtt.c/milestone/11?closed=1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/paho-mqtt-c/paho-mqtt-c.hash | 4 ++--
 package/paho-mqtt-c/paho-mqtt-c.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/paho-mqtt-c/paho-mqtt-c.hash b/package/paho-mqtt-c/paho-mqtt-c.hash
index 3c1a27084b..4d9939af31 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.hash
+++ b/package/paho-mqtt-c/paho-mqtt-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  996eef9e498519da79108f58a887a34abc50cd76770b19b0300b27783706c71f  paho-mqtt-c-1.3.5.tar.gz
+sha256  ecbc2c2000c6d8dcf1a76325312c61ed29db0b010acbd40cb92fcd4c014cd017  paho-mqtt-c-1.3.6.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  epl-v20
-sha256  99d3a5c5cc2812f0593a85ec7c1b6dd83e8477b5090c01d9de0d49d49f367a4a  LICENSE
+sha256  bc0f3f447097eb82a29ad6c2f4929572bb548b6bd4c9e38fde1bf131a771b7a0  LICENSE
diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index e11f0687df..3ac46397dd 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHO_MQTT_C_VERSION = 1.3.5
+PAHO_MQTT_C_VERSION = 1.3.6
 PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,v$(PAHO_MQTT_C_VERSION))
 PAHO_MQTT_C_LICENSE = EPL-2.0 or BSD-3-Clause
 PAHO_MQTT_C_LICENSE_FILES = epl-v20 edl-v10 LICENSE
