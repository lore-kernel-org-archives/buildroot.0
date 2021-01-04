From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jan 2021 16:21:43 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/paho-mqtt-c: bump
 to version 1.3.8
Message-ID: <20210104151308.1708A8353F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22690850643a4223009914fd5421d7f02ee9a8ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

https://github.com/eclipse/paho.mqtt.c/milestone/15?closed=1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f811ecd79be150c5c7aba0d83b08629d88df3aba)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/paho-mqtt-c/paho-mqtt-c.hash | 2 +-
 package/paho-mqtt-c/paho-mqtt-c.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/paho-mqtt-c/paho-mqtt-c.hash b/package/paho-mqtt-c/paho-mqtt-c.hash
index 93ce1b34f2..5223757f0f 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.hash
+++ b/package/paho-mqtt-c/paho-mqtt-c.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  19e9f04ddf244ab8c937d7e631ca15cedce7df95712c554107600e80efdaf277  paho-mqtt-c-1.3.7.tar.gz
+sha256  4920ff685344cdb0272568bc4414dcf48fcdfc4a98c78b1f3ca49c38417bf391  paho-mqtt-c-1.3.8.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
 sha256  0becf16567beb77fa252b7664631dd177c8f9a1889e48995b45379c7130e5303  epl-v20
 sha256  bc0f3f447097eb82a29ad6c2f4929572bb548b6bd4c9e38fde1bf131a771b7a0  LICENSE
diff --git a/package/paho-mqtt-c/paho-mqtt-c.mk b/package/paho-mqtt-c/paho-mqtt-c.mk
index a477c8baaa..b9b4f217fb 100644
--- a/package/paho-mqtt-c/paho-mqtt-c.mk
+++ b/package/paho-mqtt-c/paho-mqtt-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHO_MQTT_C_VERSION = 1.3.7
+PAHO_MQTT_C_VERSION = 1.3.8
 PAHO_MQTT_C_SITE = $(call github,eclipse,paho.mqtt.c,v$(PAHO_MQTT_C_VERSION))
 PAHO_MQTT_C_LICENSE = EPL-2.0 or BSD-3-Clause
 PAHO_MQTT_C_LICENSE_FILES = epl-v20 edl-v10 LICENSE
