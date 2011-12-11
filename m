From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Dec 2011 23:33:27 +0100
Subject: [Buildroot] [git commit] i2c-tools: fix Config.in whitespace
Message-ID: <20111211224225.034C38F8FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a877a07ee83878d6dae0dc364aacd4962fcf169a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Purely cosmetical.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/i2c-tools/Config.in |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/i2c-tools/Config.in b/package/i2c-tools/Config.in
index 47d0642..43f5e05 100644
--- a/package/i2c-tools/Config.in
+++ b/package/i2c-tools/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_I2C_TOOLS
-    bool "i2c-tools"
-    help
-        Heterogeneous set of I2C tools for Linux
+	bool "i2c-tools"
+	help
+	  Heterogeneous set of I2C tools for Linux
 
-        This package contains a heterogeneous set of I2C tools for Linux:
-        a bus probing tool, a chip dumper, register-level access helpers,
-        EEPROM decoding scripts, and more.
+	  This package contains a heterogeneous set of I2C tools for Linux:
+	  a bus probing tool, a chip dumper, register-level access helpers,
+	  EEPROM decoding scripts, and more.
 
-        http://www.lm-sensors.org
+	  http://www.lm-sensors.org
