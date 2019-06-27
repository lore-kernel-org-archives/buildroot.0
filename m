From: Joris Offouga <offougajoris@gmail.com>
Date: Thu, 27 Jun 2019 23:28:34 +0200
Subject: [Buildroot] [PATCH] packages/python-paho-mqtt: bump version to 1.4.0
Message-ID: <20190627212835.6059-1-offougajoris@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
---
 package/python-paho-mqtt/python-paho-mqtt.hash | 4 ++--
 package/python-paho-mqtt/python-paho-mqtt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-paho-mqtt/python-paho-mqtt.hash b/package/python-paho-mqtt/python-paho-mqtt.hash
index e791d367ea..35afcccedb 100644
--- a/package/python-paho-mqtt/python-paho-mqtt.hash
+++ b/package/python-paho-mqtt/python-paho-mqtt.hash
@@ -1,6 +1,6 @@
 # md5 from https://pypi.python.org/pypi/paho-mqtt/json, sha256 locally computed
-md5	2cc27d8b369700b1fc99325add0dadd2  paho-mqtt-1.3.1.tar.gz
-sha256	31911f6031de306c27ed79dc77b690d7c55b0dcb0f0434ca34ec6361d0371122  paho-mqtt-1.3.1.tar.gz
+md5	e3ac29cd5dc247a01083a2a8f3fddd08  paho-mqtt-1.4.0.tar.gz
+sha256	e440a052b46d222e184be3be38676378722072fcd4dfd2c8f509fb861a7b0b79  paho-mqtt-1.4.0.tar.gz
 sha256	76f13729e84e9222e543303df00f87d1b2c0995b6a505cd859a285667e44babb  LICENSE.txt
 sha256	e8cf7d54ea46c19aba793983889b7f7425e1ebfcaaccec764a7db091646e203c  edl-v10
 sha256	3b9be6b894d0769de796e653571ff6cef494913c0ce78c35a97db939e7d9087c  epl-v10
diff --git a/package/python-paho-mqtt/python-paho-mqtt.mk b/package/python-paho-mqtt/python-paho-mqtt.mk
index f335b35edb..d192749e1e 100644
--- a/package/python-paho-mqtt/python-paho-mqtt.mk
+++ b/package/python-paho-mqtt/python-paho-mqtt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PAHO_MQTT_VERSION = 1.3.1
+PYTHON_PAHO_MQTT_VERSION = 1.4.0
 PYTHON_PAHO_MQTT_SOURCE = paho-mqtt-$(PYTHON_PAHO_MQTT_VERSION).tar.gz
-PYTHON_PAHO_MQTT_SITE = https://pypi.python.org/packages/2a/5f/cf14b8f9f8ed1891cda893a2a7d1d6fa23de2a9fb4832f05cef02b79d01f
+PYTHON_PAHO_MQTT_SITE = https://files.pythonhosted.org/packages/25/63/db25e62979c2a716a74950c9ed658dce431b5cb01fde29eb6cba9489a904
 PYTHON_PAHO_MQTT_LICENSE = EPL-1.0 or EDLv1.0
 PYTHON_PAHO_MQTT_LICENSE_FILES = LICENSE.txt edl-v10 epl-v10
 PYTHON_PAHO_MQTT_SETUP_TYPE = setuptools
-- 
2.17.1
