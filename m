From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2016 23:00:45 +0200
Subject: [Buildroot] [git commit] package/python-paho-mqtt: bump version to
	1.2
Message-ID: <20161005210758.8B00381DD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4a5426784c178ff75b35aef39e3b1ee5b303b91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-paho-mqtt/python-paho-mqtt.hash | 6 +++---
 package/python-paho-mqtt/python-paho-mqtt.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-paho-mqtt/python-paho-mqtt.hash b/package/python-paho-mqtt/python-paho-mqtt.hash
index 52729cc..6cb3cc2 100644
--- a/package/python-paho-mqtt/python-paho-mqtt.hash
+++ b/package/python-paho-mqtt/python-paho-mqtt.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=a6407b74eb5e5411e157be1de5c11366, sha256 locally computed
-md5     a6407b74eb5e5411e157be1de5c11366  paho-mqtt-1.1.tar.gz
-sha256  0f7a629efe6e3a2c61b59d3550aa9f2c4529b5689a65fde45e6f1ac36b9a261e  paho-mqtt-1.1.tar.gz
+# md5 from https://pypi.python.org/pypi/paho-mqtt/json, sha256 locally computed
+md5	241150b3fcb920ddca4d33181f3238b1  paho-mqtt-1.2.tar.gz
+sha256	9100a6aa706ab699d414ec02705a21eb66f436184691d0bf1f2a85a6213c6c1f  paho-mqtt-1.2.tar.gz
diff --git a/package/python-paho-mqtt/python-paho-mqtt.mk b/package/python-paho-mqtt/python-paho-mqtt.mk
index 01da2b3..d783a9c 100644
--- a/package/python-paho-mqtt/python-paho-mqtt.mk
+++ b/package/python-paho-mqtt/python-paho-mqtt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PAHO_MQTT_VERSION = 1.1
+PYTHON_PAHO_MQTT_VERSION = 1.2
 PYTHON_PAHO_MQTT_SOURCE = paho-mqtt-$(PYTHON_PAHO_MQTT_VERSION).tar.gz
-PYTHON_PAHO_MQTT_SITE = https://pypi.python.org/packages/source/p/paho-mqtt
+PYTHON_PAHO_MQTT_SITE = https://pypi.python.org/packages/82/d9/7064d3a0a1d62756a1a809c85b99f864c641b66de84c15458f72193b7708
 PYTHON_PAHO_MQTT_LICENSE = EPLv1.0 or EDLv1.0
 PYTHON_PAHO_MQTT_LICENSE_FILES = LICENSE.txt edl-v10 epl-v10
 PYTHON_PAHO_MQTT_SETUP_TYPE = distutils
