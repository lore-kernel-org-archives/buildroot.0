From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 22 Feb 2015 10:59:32 +0200
Subject: [Buildroot] [PATCH] i2c-tools: link to i2c-tools specific wiki page
Message-ID: <0b7a7b4ce052481042ceb1cd960dc07d020ac21b.1424595572.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Although there is a link to that page from the main lm-sensors page, it is
quite hard to find.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/i2c-tools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/i2c-tools/Config.in b/package/i2c-tools/Config.in
index 43f5e05ae854..e83dbd65fa7e 100644
--- a/package/i2c-tools/Config.in
+++ b/package/i2c-tools/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_I2C_TOOLS
 	  a bus probing tool, a chip dumper, register-level access helpers,
 	  EEPROM decoding scripts, and more.
 
-	  http://www.lm-sensors.org
+	  http://www.lm-sensors.org/wiki/I2CTools
-- 
2.1.4
