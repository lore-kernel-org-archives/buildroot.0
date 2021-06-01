From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue,  1 Jun 2021 13:15:52 +0200
Subject: [Buildroot] [PATCH] package/i2c-tools: add I2C_TOOLS_CPE_ID_VENDOR
Message-ID: <20210601111551.4155-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:i2c-tools_project:i2c-tools is a valid CPE identifier for this
package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ai2c-tools_project%3Ai2c-tools

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/i2c-tools/i2c-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index c1770cf636..8936f6c4f6 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -9,6 +9,7 @@ I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.xz
 I2C_TOOLS_SITE = https://www.kernel.org/pub/software/utils/i2c-tools
 I2C_TOOLS_LICENSE = GPL-2.0+, GPL-2.0 (py-smbus), LGPL-2.1+ (libi2c)
 I2C_TOOLS_LICENSE_FILES = COPYING COPYING.LGPL README
+I2C_TOOLS_CPE_ID_VENDOR = i2c-tools_project
 I2C_TOOLS_MAKE_OPTS = EXTRA=eeprog
 I2C_TOOLS_INSTALL_STAGING = YES
 
-- 
2.30.0
