From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 19 Jul 2021 00:07:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/ripgrep: add RIPGREP_CPE_ID_VENDOR
Message-ID: <20210718220700.3297109-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

cpe:2.3:a:ripgrep_project:ripgrep is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aripgrep_project%3Aripgrep

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ripgrep/ripgrep.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index c3c12fd185..2cc578383d 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -8,6 +8,7 @@ RIPGREP_VERSION = 0.8.1
 RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
 RIPGREP_LICENSE = MIT
 RIPGREP_LICENSE_FILES = LICENSE-MIT
+RIPGREP_CPE_ID_VENDOR = ripgrep_project
 
 RIPGREP_DEPENDENCIES = host-rustc
 RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
-- 
2.30.2
