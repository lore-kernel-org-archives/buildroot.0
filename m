From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 31 Dec 2017 13:25:06 +0200
Subject: [Buildroot] [PATCH] eeprog: fix homepage link
Message-ID: <5d4e572b6a29cdf484a8df1562993d68206022dd.1514719506.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current link leads to a 400 Bad Request error page.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/eeprog/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/eeprog/Config.in b/package/eeprog/Config.in
index ff313bdbae96..73582c70f9d4 100644
--- a/package/eeprog/Config.in
+++ b/package/eeprog/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_EEPROG
 	help
 	  Simple tool to read/write i2c eeprom chips.
 
-	  http://codesink.org/eeprog.html
+	  http://www.codesink.org/eeprog.html
-- 
2.15.1
