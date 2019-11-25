From: Mark Corbin <mark@dibsco.co.uk>
Date: Mon, 25 Nov 2019 20:36:58 +0000
Subject: [Buildroot] [PATCH 1/1] package/bind: update the upstream URL in
 Config.in
Message-ID: <20191125203658.19575-1-mark@dibsco.co.uk>
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
 package/bind/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bind/Config.in b/package/bind/Config.in
index 6d4ee2e6d7..db10ceb304 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -22,7 +22,7 @@ config BR2_PACKAGE_BIND
 	  intended to be linked with applications requiring name
 	  service.
 
-	  http://www.isc.org/sw/bind/
+	  https://www.isc.org/bind/
 
 if BR2_PACKAGE_BIND
 
-- 
2.20.1
