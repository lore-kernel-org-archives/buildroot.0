From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 10:25:46 +0100
Subject: [Buildroot] [git commit] i2c-tools: link to i2c-tools specific wiki
	page
Message-ID: <20150222092553.2CCC8805F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3c08a79aad60cce37c04f724f776e7c7de7df91
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Although there is a link to that page from the main lm-sensors page, it is
quite hard to find.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/i2c-tools/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/i2c-tools/Config.in b/package/i2c-tools/Config.in
index 43f5e05..e83dbd6 100644
--- a/package/i2c-tools/Config.in
+++ b/package/i2c-tools/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_I2C_TOOLS
 	  a bus probing tool, a chip dumper, register-level access helpers,
 	  EEPROM decoding scripts, and more.
 
-	  http://www.lm-sensors.org
+	  http://www.lm-sensors.org/wiki/I2CTools
