From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 May 2021 19:53:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/picocom: add PICOCOM_CPE_ID_VENDOR
Message-ID: <20210522175351.279349-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:picocom_project:picocom is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apicocom_project%3Apicocom

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/picocom/picocom.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/picocom/picocom.mk b/package/picocom/picocom.mk
index d27c734376..2d585bb2f5 100644
--- a/package/picocom/picocom.mk
+++ b/package/picocom/picocom.mk
@@ -8,6 +8,7 @@ PICOCOM_VERSION = 3.1
 PICOCOM_SITE = $(call github,npat-efault,picocom,$(PICOCOM_VERSION))
 PICOCOM_LICENSE = GPL-2.0+
 PICOCOM_LICENSE_FILES = LICENSE.txt
+PICOCOM_CPE_ID_VENDOR = picocom_project
 
 define PICOCOM_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
-- 
2.30.2
