From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 09 Oct 2013 09:10:51 +0200
Subject: [Buildroot] [PATCH v2] i2c-tools: add license information
Message-ID: <fc3b3afc1459d7a16e5b.1381302651@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: clarify separate py-smbus license (Arnout)

 package/i2c-tools/i2c-tools.mk |  2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -7,6 +7,8 @@
 I2C_TOOLS_VERSION = 3.1.0
 I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.bz2
 I2C_TOOLS_SITE = http://dl.lm-sensors.org/i2c-tools/releases
+I2C_TOOLS_LICENSE = GPLv2+, GPLv2 (py-smbus)
+I2C_TOOLS_LICENSE_FILES = COPYING
 
 define I2C_TOOLS_BUILD_CMDS
  $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
