From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 10 Jul 2015 12:54:59 +0300
Subject: [Buildroot] [PATCH] bootutils: update website URL
Message-ID: <958e161f6db21f2f5c374079f23860e969e9eb46.1436522099.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The original homepage seems to be down. Use the sourceforge intro page
instead.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/bootutils/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bootutils/Config.in b/package/bootutils/Config.in
index 308db248b215..370da0d1eb2c 100644
--- a/package/bootutils/Config.in
+++ b/package/bootutils/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_BOOTUTILS
 	  either by label or explicit label= on the kernel command line,
 	  mounting it, and 'switchroot'ing is automated.
 
-	  http://bootutils.pr.linuxrulz.org/
+	  http://bootutils.sourceforge.net/
-- 
2.1.4
