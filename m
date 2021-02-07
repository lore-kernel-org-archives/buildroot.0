From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Feb 2021 14:07:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/mosquitto: add
 MOSQUITTO_CPE_ID_VENDOR
Message-ID: <20210207130746.2934924-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:eclipse:mosquitto is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aeclipse%3Amosquitto

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mosquitto/mosquitto.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index d5fe6de3b1..7dfdf59451 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -8,6 +8,7 @@ MOSQUITTO_VERSION = 2.0.7
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
+MOSQUITTO_CPE_ID_VENDOR = eclipse
 MOSQUITTO_INSTALL_STAGING = YES
 
 MOSQUITTO_MAKE_OPTS = \
-- 
2.29.2
