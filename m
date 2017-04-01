From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 22:38:58 +0200
Subject: [Buildroot] [git commit] package: use SPDX short identifier for EPL
	license
Message-ID: <20170401203935.C3C68816A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39f8da7fa3b68efe2ee75e17c662a3b8e26985cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mosquitto/mosquitto.mk               | 2 +-
 package/python-paho-mqtt/python-paho-mqtt.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 96607f3..ddac153 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -6,7 +6,7 @@
 
 MOSQUITTO_VERSION = 1.4.10
 MOSQUITTO_SITE = http://mosquitto.org/files/source
-MOSQUITTO_LICENSE = EPLv1.0 or EDLv1.0
+MOSQUITTO_LICENSE = EPL-1.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v10 edl-v10
 MOSQUITTO_INSTALL_STAGING = YES
 
diff --git a/package/python-paho-mqtt/python-paho-mqtt.mk b/package/python-paho-mqtt/python-paho-mqtt.mk
index d783a9c..f0c2729 100644
--- a/package/python-paho-mqtt/python-paho-mqtt.mk
+++ b/package/python-paho-mqtt/python-paho-mqtt.mk
@@ -7,7 +7,7 @@
 PYTHON_PAHO_MQTT_VERSION = 1.2
 PYTHON_PAHO_MQTT_SOURCE = paho-mqtt-$(PYTHON_PAHO_MQTT_VERSION).tar.gz
 PYTHON_PAHO_MQTT_SITE = https://pypi.python.org/packages/82/d9/7064d3a0a1d62756a1a809c85b99f864c641b66de84c15458f72193b7708
-PYTHON_PAHO_MQTT_LICENSE = EPLv1.0 or EDLv1.0
+PYTHON_PAHO_MQTT_LICENSE = EPL-1.0 or EDLv1.0
 PYTHON_PAHO_MQTT_LICENSE_FILES = LICENSE.txt edl-v10 epl-v10
 PYTHON_PAHO_MQTT_SETUP_TYPE = distutils
 
