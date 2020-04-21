From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 21:33:13 +0200
Subject: [Buildroot] [git commit] package/paho-mqtt-c: bump to version 1.3.2
Message-ID: <20200421191949.C54848FA91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e69b8ddd43292b03b8f30f748ee2279b8df64c47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

paho-c-mqtt 1.3.2 is a maintenance release. It fixes many bugs
including memory leaks and segmentation faults.

Release notes: https://github.com/eclipse/paho.mqtt.c/milestone/7?closed=1

Signed-off-by: Julien Grossholtz <julien.grossholtz@openest.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/paho-mqtt-c/paho-mqtt-c.hash | 2 +-
 package/paho-mqtt-c/paho-mqtt-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/paho-mqtt-c/paho-mqtt-c.hash b/package/paho-mqtt-c/paho-mqtt-c.hash
index 97b15d1320..80231c762a 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.hash
+++ b/package/paho-mqtt-c/paho-mqtt-c.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  7b4eed66ae3df3613629139c0df28b16abfa4e0927bd17360027d936784aa55e  paho-mqtt-c-1.3.1.tar.gz
+sha256  c2d74a37c8e23d6eef229db0e04cb8e511571562668808e02d836e82d5bbd0ae  paho-mqtt-c-1.3.2.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
 sha256  44277b2bec6093e4ac313afec251a4de599d24c4e768f8574d95b13a9d2d97b5  epl-v10
diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index 8772d73be0..49d5be3777 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHO_MQTT_C_VERSION = 1.3.1
+PAHO_MQTT_C_VERSION = 1.3.2
 PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,v$(PAHO_MQTT_C_VERSION))
 PAHO_MQTT_C_LICENSE = EPL-1.0 or BSD-3-Clause
 PAHO_MQTT_C_LICENSE_FILES = epl-v10 edl-v10
