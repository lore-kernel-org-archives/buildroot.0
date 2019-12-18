From: Mark Corbin <mark@dibsco.co.uk>
Date: Wed, 18 Dec 2019 14:24:16 +0000
Subject: [Buildroot] [PATCH 1/1] package/w_scan: update the upstream URL in
 Config.in
Message-ID: <20191218142416.16195-1-mark@dibsco.co.uk>
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
 package/w_scan/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/w_scan/Config.in b/package/w_scan/Config.in
index 01dbbae122..b41bc546d5 100644
--- a/package/w_scan/Config.in
+++ b/package/w_scan/Config.in
@@ -11,4 +11,4 @@ config BR2_PACKAGE_W_SCAN
 	  capable of creating channels.conf files (in different output
 	  formats !) as well as initial tuning data for scan.
 
-	  http://wirbel.htpc-forum.de/w_scan/index_en.html
+	  https://www.gen2vdr.de/wirbel/w_scan/index_en.html
-- 
2.20.1
