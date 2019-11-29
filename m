From: Mark Corbin <mark@dibsco.co.uk>
Date: Fri, 29 Nov 2019 16:01:14 +0000
Subject: [Buildroot] [PATCH 1/1] package/opkg: update the upstream URL in
 Config.in
Message-ID: <20191129160114.16560-1-mark@dibsco.co.uk>
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
 package/opkg/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opkg/Config.in b/package/opkg/Config.in
index 20f6fa2f53..1f6a39343f 100644
--- a/package/opkg/Config.in
+++ b/package/opkg/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_OPKG
 	  conforms to a subset of debian's policy manual regarding
 	  control files.
 
-	  http://code.google.com/p/opkg/
+	  https://code.google.com/archive/p/opkg/
 
 if BR2_PACKAGE_OPKG
 
-- 
2.20.1
