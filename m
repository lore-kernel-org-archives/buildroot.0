From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  3 Mar 2021 15:44:25 +0100
Subject: [Buildroot] [PATCH 1/1] package/neon: add NEON_CPE_ID_VENDOR
Message-ID: <20210303144425.501473-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:webdav:neon is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awebdav%3Aneon

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/neon/neon.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 2c00e6a8b4..da53735d0e 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -8,6 +8,7 @@ NEON_VERSION = 0.30.2
 NEON_SITE = http://www.webdav.org/neon
 NEON_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (manual and tests)
 NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README
+NEON_CPE_ID_VENDOR = webdav
 NEON_INSTALL_STAGING = YES
 NEON_CONF_OPTS = --without-gssapi --disable-rpath
 NEON_CONFIG_SCRIPTS = neon-config
-- 
2.30.0
