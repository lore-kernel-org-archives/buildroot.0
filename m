From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  2 Mar 2021 10:28:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/bootstrap: add
 BOOTSRAP_CPE_ID_VENDOR
Message-ID: <20210302092810.291495-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:getbootstrap:bootstrap is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agetbootstrap%3Abootstrap

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bootstrap/bootstrap.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bootstrap/bootstrap.mk b/package/bootstrap/bootstrap.mk
index c9f6003b52..eba1244ad3 100644
--- a/package/bootstrap/bootstrap.mk
+++ b/package/bootstrap/bootstrap.mk
@@ -9,6 +9,7 @@ BOOTSTRAP_SITE = https://github.com/twbs/bootstrap/releases/download/v$(BOOTSTRA
 BOOTSTRAP_SOURCE = bootstrap-$(BOOTSTRAP_VERSION)-dist.zip
 BOOTSTRAP_LICENSE = MIT
 BOOTSTRAP_LICENSE_FILES = css/bootstrap.css
+BOOTSTRAP_CPE_ID_VENDOR = getbootstrap
 
 define BOOTSTRAP_EXTRACT_CMDS
 	$(UNZIP) $(BOOTSTRAP_DL_DIR)/$(BOOTSTRAP_SOURCE) -d $(@D)
-- 
2.30.0
