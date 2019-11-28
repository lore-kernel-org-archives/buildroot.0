From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 13:08:10 +0000
Subject: [Buildroot] [PATCH 1/1] package/libsexy: update the upstream URL in
 Config.in
Message-ID: <20191128130810.5728-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(500)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/libsexy/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsexy/Config.in b/package/libsexy/Config.in
index 5d1e710c44..a2a2cc820c 100644
--- a/package/libsexy/Config.in
+++ b/package/libsexy/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_LIBSEXY
 	  GtkLabel by subclassing them and working around the
 	  limitations of the widgets.
 
-	  http://www.chipx86.com/wiki/Libsexy
+	  https://blog.chipx86.com/tag/libsexy/
-- 
2.20.1
