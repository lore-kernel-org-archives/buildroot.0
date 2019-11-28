From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 15:08:44 +0000
Subject: [Buildroot] [PATCH 1/1] package/mali-t76x: update the upstream URL
 in Config.in
Message-ID: <20191128150844.15298-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in. Removing
the text from the beginning of the URL line addresses the 'Missing'
URL status in the package stats web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/mali-t76x/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mali-t76x/Config.in b/package/mali-t76x/Config.in
index a85fa5b27e..2533f10002 100644
--- a/package/mali-t76x/Config.in
+++ b/package/mali-t76x/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_MALI_T76X
 	  Midgard T76X GPU. This package requires a kernel with the
 	  ARM Mali Midgard GPU Kernel Drivers enabled.
 
-	  Source: http://malideveloper.arm.com/resources/drivers/
+	  http://malideveloper.arm.com/resources/drivers/
 
 if BR2_PACKAGE_MALI_T76X
 
-- 
2.20.1
