From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 May 2019 10:02:43 +0200
Subject: [Buildroot] [PATCH] package/dhcp: fix upstream URL in Config.in
Message-ID: <20190517080243.21719-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current URL no longer exists, so update it to what looks like the
main DHCP upstream site.

This issue was noticed by the upstream URL check added by Matt Weber
in the pkg-stats script, whose results are visible at
http://autobuild.buildroot.net/stats/.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dhcp/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dhcp/Config.in b/package/dhcp/Config.in
index a4930e53ba..e626d78a4c 100644
--- a/package/dhcp/Config.in
+++ b/package/dhcp/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_DHCP
 	help
 	  DHCP relay agent from the ISC DHCP distribution.
 
-	  http://www.isc.org/products/DHCP
+	  https://www.isc.org/downloads/dhcp/
 
 if BR2_PACKAGE_DHCP
 
-- 
2.21.0
