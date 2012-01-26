From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Jan 2012 22:23:16 +0100
Subject: [Buildroot] [git commit] i2c-tools: bump to version 3.1.0
Message-ID: <20120126212542.5F5CA9058C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c72d3a2a7e2c041f1e7566d78368ca01efa8f3f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/i2c-tools/i2c-tools.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 8628eaf..aeabf02 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-I2C_TOOLS_VERSION = 3.0.3
+I2C_TOOLS_VERSION = 3.1.0
 I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.bz2
-I2C_TOOLS_SITE = http://dl.lm-sensors.org/i2c-tools/releases/
+I2C_TOOLS_SITE = http://dl.lm-sensors.org/i2c-tools/releases
 
 define I2C_TOOLS_BUILD_CMDS
  $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
