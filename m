From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Mar 2021 08:08:41 +0100
Subject: [Buildroot] [git commit] package/neon: add NEON_CPE_ID_VENDOR
Message-ID: <20210304065255.00FE886AA7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a6d53c9f0bac7963616e14f7e3d428ab1cb72a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:webdav:neon is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awebdav%3Aneon

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
