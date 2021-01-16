From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 21:56:37 +0100
Subject: [Buildroot] [git commit] package/domoticz: add
 DOMOTICZ_CPE_ID_VENDOR
Message-ID: <20210116203845.92FF587A38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=026a1b02d0708a2274b4aa446ce813c0c07c14fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:domoticz:domoticz is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adomoticz%3Adomoticz

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/domoticz/domoticz.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index 0ceaab87b4..0cd3520a71 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -8,6 +8,7 @@ DOMOTICZ_VERSION = 2020.1
 DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPL-3.0
 DOMOTICZ_LICENSE_FILES = License.txt
+DOMOTICZ_CPE_ID_VENDOR = domoticz
 DOMOTICZ_DEPENDENCIES = \
 	boost \
 	host-pkgconf \
