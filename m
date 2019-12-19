From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 19 Dec 2019 20:49:26 +0000
Subject: [Buildroot] [PATCH 1/1] package/wsapi: update the upstream URL in
 Config.in
Message-ID: <20191219204926.24980-1-mark@dibsco.co.uk>
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
 package/wsapi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wsapi/Config.in b/package/wsapi/Config.in
index 72e2dcd8e0..e758e8e0a6 100644
--- a/package/wsapi/Config.in
+++ b/package/wsapi/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_WSAPI
 	help
 	  API that abstracts the web server from Lua web applications.
 
-	  http://www.keplerproject.org/wsapi
+	  https://keplerproject.github.io/wsapi/
-- 
2.20.1
