From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 10:27:24 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/i2c-tools: add
 I2C_TOOLS_CPE_ID_VENDOR
Message-ID: <20210610075846.96FD086F32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c31386b070f6aa58325d7b8047df7b81b0bbf20a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:i2c-tools_project:i2c-tools is a valid CPE identifier for this
package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ai2c-tools_project%3Ai2c-tools

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 9584765654c8e71842ad516b5979b3d7f396370f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
