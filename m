From: Mark Corbin <mark@dibsco.co.uk>
Date: Tue, 26 Nov 2019 15:57:39 +0000
Subject: [Buildroot] [PATCH 1/1] package/gqview: update the upstream URL in
 Config.in
Message-ID: <20191126155739.2623-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/gqview/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gqview/Config.in b/package/gqview/Config.in
index c1df40cc19..a654dc41fb 100644
--- a/package/gqview/Config.in
+++ b/package/gqview/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_GQVIEW
 	help
 	  GQview is an image viewer for Unix operating systems
 
-	  http://prdownloads.sourceforge.net/gqview
+	  http://gqview.sourceforge.net/
-- 
2.20.1
