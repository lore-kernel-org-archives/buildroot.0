From: Brad Love <brad@nextdimension.cc>
Date: Thu, 23 Aug 2018 14:56:26 -0500
Subject: [Buildroot] [PATCH 1/2] i2c-tools: include LGPL-2.1+ license for
 libi2c
In-Reply-To: <1535054187-6055-1-git-send-email-brad@nextdimension.cc>
References: <1535054187-6055-1-git-send-email-brad@nextdimension.cc>
Message-ID: <1535054187-6055-2-git-send-email-brad@nextdimension.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Extend i2c-tools SPDX identifiers to include the library license.

The ic2-tools readme states:

LICENSE

Check the documentation of individual tools for licensing information.
The library is released under the LGPL version 2.1 or later, while most
tools are released under the GPL version 2 or later, but there are a few
exceptions.


Signed-off-by: Brad Love <brad@nextdimension.cc>
---
 package/i2c-tools/i2c-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index db26647..a346698 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -7,7 +7,7 @@
 I2C_TOOLS_VERSION = 4.0
 I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.xz
 I2C_TOOLS_SITE = https://www.kernel.org/pub/software/utils/i2c-tools
-I2C_TOOLS_LICENSE = GPL-2.0+, GPL-2.0 (py-smbus)
+I2C_TOOLS_LICENSE = GPL-2.0+, GPL-2.0 (py-smbus), LGPL-2.1+ (libi2c)
 I2C_TOOLS_LICENSE_FILES = COPYING
 I2C_TOOLS_MAKE_OPTS = EXTRA=eeprog
 
-- 
2.7.4
