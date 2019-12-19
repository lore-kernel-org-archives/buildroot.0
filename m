From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 19 Dec 2019 21:00:31 +0000
Subject: [Buildroot] [PATCH 1/1] package/x265: update the upstream URL in
 Config.in
Message-ID: <20191219210031.26512-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(Err)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/x265/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x265/Config.in b/package/x265/Config.in
index cc39d6c6a9..180931db66 100644
--- a/package/x265/Config.in
+++ b/package/x265/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_X265
 	  General Public License (GPL) 2 license or a commercial
 	  license, similar to the x264 project.
 
-	  http://x265.org
+	  https://bitbucket.org/multicoreware/x265/wiki/Home
 
 if BR2_PACKAGE_X265
 
-- 
2.20.1
