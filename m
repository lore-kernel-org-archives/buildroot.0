From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 19 Dec 2019 20:16:48 +0000
Subject: [Buildroot] [PATCH 1/1] package/wsapi-fcgi: update the upstream URL
 in Config.in
Message-ID: <20191219201648.21441-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(406)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/wsapi-fcgi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wsapi-fcgi/Config.in b/package/wsapi-fcgi/Config.in
index 73ef8cb00c..657ae78c66 100644
--- a/package/wsapi-fcgi/Config.in
+++ b/package/wsapi-fcgi/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_WSAPI_FCGI
 	  applications. This is the rock that contains the FCGI module
 	  lfcgi.
 
-	  http://www.keplerproject.org/wsapi
+	  https://luarocks.org/modules/mascarenhas/wsapi-fcgi
-- 
2.20.1
