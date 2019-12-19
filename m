From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 19 Dec 2019 20:36:26 +0000
Subject: [Buildroot] [PATCH 1/1] package/wsapi-xavante: update the upstream
 URL in Config.in
Message-ID: <20191219203626.23360-1-mark@dibsco.co.uk>
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
 package/wsapi-xavante/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wsapi-xavante/Config.in b/package/wsapi-xavante/Config.in
index 7079ad4eda..7af23b84e4 100644
--- a/package/wsapi-xavante/Config.in
+++ b/package/wsapi-xavante/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_WSAPI_XAVANTE
 	  applications. This is the rock that contains the Xavante
 	  adapter and launcher.
 
-	  http://www.keplerproject.org/wsapi
+	  https://keplerproject.github.io/wsapi/
-- 
2.20.1
