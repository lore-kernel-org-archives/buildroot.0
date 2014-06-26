From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 26 Jun 2014 21:10:19 +0300
Subject: [Buildroot] [PATCH] dhcpcd: refer to the actual homepage
Message-ID: <db491d6194f2cef434deb3ae566fbd67beb140df.1403806219.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dhcpcd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
index 79063eff42a4..ca0ad751ffcb 100644
--- a/package/dhcpcd/Config.in
+++ b/package/dhcpcd/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_DHCPCD
 	help
 	  An RFC2131 compliant DHCP client
 
-	  http://roy.marples.name/downloads/dhcpcd
+	  http://roy.marples.name/projects/dhcpcd/
-- 
2.0.0
