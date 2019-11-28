From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 16:55:22 +0000
Subject: [Buildroot] [PATCH 1/1] package/mp4v2: update the upstream URL in
 Config.in
Message-ID: <20191128165522.31804-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(405)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/mp4v2/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mp4v2/Config.in b/package/mp4v2/Config.in
index 42315a2272..490ebac9fd 100644
--- a/package/mp4v2/Config.in
+++ b/package/mp4v2/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_MP4V2
 	  The MP4v2 library provides functions to read, create, and
 	  modify mp4 files.
 
-	  https://code.google.com/p/mp4v2/
+	  https://code.google.com/archive/p/mp4v2/
 
 if BR2_PACKAGE_MP4V2
 
-- 
2.20.1
