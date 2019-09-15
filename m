From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 15:23:05 +0200
Subject: [Buildroot] [git commit] package/paho-mqtt-cpp: bump to version
 1.0.1
Message-ID: <20190915131826.64ECB8E2CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1d1a57d159b52873b109b6388a95d12e215fe268
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Refik Tuzakli <refik.tuzakli@savronik.com.tr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/paho-mqtt-cpp/paho-mqtt-cpp.hash | 2 +-
 package/paho-mqtt-cpp/paho-mqtt-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/paho-mqtt-cpp/paho-mqtt-cpp.hash b/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
index d4af11b830..b98e073556 100644
--- a/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
+++ b/package/paho-mqtt-cpp/paho-mqtt-cpp.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  9f78afb988e9ce9bb7cb74805053221efbb073b74683e222d1d087633178b51f  paho-mqtt-cpp-1.0.0.tar.gz
+sha256  e97386d159b811e534b98d21e3f6881ab2b43678ec026da7525d5c21ebc292ff  paho-mqtt-cpp-1.0.1.tar.gz
 sha256  83bbba033dc985487e321b6dfde111772affb73460be48726299fed3da684b1c  edl-v10
 sha256  44277b2bec6093e4ac313afec251a4de599d24c4e768f8574d95b13a9d2d97b5  epl-v10
diff --git a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
index 16e524a96c..246e076242 100644
--- a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
+++ b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHO_MQTT_CPP_VERSION = 1.0.0
+PAHO_MQTT_CPP_VERSION = 1.0.1
 PAHO_MQTT_CPP_SITE = $(call github,eclipse,paho.mqtt.cpp,v$(PAHO_MQTT_CPP_VERSION))
 PAHO_MQTT_CPP_LICENSE = EPL-1.0 or BSD-3-Clause
 PAHO_MQTT_CPP_LICENSE_FILES = epl-v10 edl-v10
