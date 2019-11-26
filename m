From: Mark Corbin <mark@dibsco.co.uk>
Date: Tue, 26 Nov 2019 12:45:28 +0000
Subject: [Buildroot] [PATCH 1/1] package/copas: update the upstream URL in
 Config.in
Message-ID: <20191126124529.14814-1-mark@dibsco.co.uk>
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
 package/copas/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/copas/Config.in b/package/copas/Config.in
index 2de1967102..347d86ddfc 100644
--- a/package/copas/Config.in
+++ b/package/copas/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_COPAS
 	  servers. But it also features timers and client support for
 	  http(s), ftp and smtp requests.
 
-	  http://www.keplerproject.org/copas/
+	  http://keplerproject.github.io/copas/
-- 
2.20.1
