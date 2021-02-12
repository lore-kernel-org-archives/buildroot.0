From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Feb 2021 22:59:58 +0100
Subject: [Buildroot] [git commit] package/axel: set AXEL_CPE_ID_VALID
Message-ID: <20210212215302.9E6FD81371@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de2d473dce9cf9b5de9a50febf948e9d953fbff2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:axel_project:axel is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aaxel_project%3Aaxel

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/axel/axel.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/axel/axel.mk b/package/axel/axel.mk
index 2118a3438e..8dbf277b88 100644
--- a/package/axel/axel.mk
+++ b/package/axel/axel.mk
@@ -9,6 +9,7 @@ AXEL_SITE = https://github.com/axel-download-accelerator/axel/releases/download/
 AXEL_SOURCE = axel-$(AXEL_VERSION).tar.xz
 AXEL_LICENSE = GPL-2.0+
 AXEL_LICENSE_FILES = COPYING
+AXEL_CPE_ID_VALID = YES
 AXEL_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 
 # ac_cv_prog_cc_c99 is required for BR2_USE_WCHAR=n because the C99 test
