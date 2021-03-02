From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 2 Mar 2021 14:01:05 +0100
Subject: [Buildroot] [git commit] package/bootstrap: add
 BOOTSRAP_CPE_ID_VENDOR
Message-ID: <20210302123842.22E3F86AE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=173eabf3b64299799a6362029006f64a47c86d59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:getbootstrap:bootstrap is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agetbootstrap%3Abootstrap

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
