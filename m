From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 15 Jan 2021 07:53:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/domoticz: add DOMOTICZ_CPE_ID_VENDOR
Message-ID: <20210115065358.2074019-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:domoticz:domoticz is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adomoticz%3Adomoticz

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/domoticz/domoticz.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 9288075f44..2b36b36e24 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -8,6 +8,7 @@ DOMOTICZ_VERSION = 2020.2
 DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPL-3.0
 DOMOTICZ_LICENSE_FILES = License.txt
+DOMOTICZ_CPE_ID_VENDOR = domoticz
 DOMOTICZ_DEPENDENCIES = \
 	boost \
 	cereal \
-- 
2.29.2
