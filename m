From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 12:06:26 +0000
Subject: [Buildroot] [PATCH 1/1] package/libfcgi: update the upstream URL in
 Config.in
Message-ID: <20191128120627.27878-1-mark@dibsco.co.uk>
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
 package/libfcgi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libfcgi/Config.in b/package/libfcgi/Config.in
index 47ff8a2d13..aceea3e897 100644
--- a/package/libfcgi/Config.in
+++ b/package/libfcgi/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_LIBFCGI
 	help
 	  FCGI, a fastcgi developer library for C/C++
 
-	  http://www.fastcgi.com/
+	  https://fastcgi-archives.github.io/
-- 
2.20.1
