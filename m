From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 08 Oct 2013 12:06:55 +0200
Subject: [Buildroot] [PATCH 1 of 4] i2c-tools: add license information
In-Reply-To: <patchbomb.1381226814@argentina>
References: <patchbomb.1381226814@argentina>
Message-ID: <8d5a6b127c579be29db4.1381226815@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/i2c-tools/i2c-tools.mk |  2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -7,6 +7,8 @@
 I2C_TOOLS_VERSION = 3.1.0
 I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.bz2
 I2C_TOOLS_SITE = http://dl.lm-sensors.org/i2c-tools/releases
+I2C_TOOLS_LICENSE = GPLv2
+I2C_TOOLS_LICENSE_FILES = COPYING
 
 define I2C_TOOLS_BUILD_CMDS
  $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
