From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 22:11:08 +0200
Subject: [Buildroot] [git commit] i2c-tools: add license information
Message-ID: <20131009202219.DF4E29B98A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e8d807e3a6a65b1a26fd2110b4de826ec1a3f2a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/i2c-tools/i2c-tools.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 1589d04..c6a967d 100644
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
