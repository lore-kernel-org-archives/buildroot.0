From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  7 Apr 2017 06:40:45 +0300
Subject: [Buildroot] [PATCH 1/2] ethtool: update homepage link
Message-ID: <b8a0c47ad82f584df2871486c6754dda036456a5.1491536446.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ethtool/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ethtool/Config.in b/package/ethtool/Config.in
index 48c6062a612b..09704979e864 100644
--- a/package/ethtool/Config.in
+++ b/package/ethtool/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_ETHTOOL
 	  ethtool is a small utility for examining and tuning your
 	  ethernet-based network interface.
 
-	  http://sourceforge.net/projects/gkernel/
+	  https://www.kernel.org/pub/software/network/ethtool/
-- 
2.11.0
