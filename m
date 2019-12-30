From: Mark Corbin <mark@dibsco.co.uk>
Date: Mon, 30 Dec 2019 15:24:21 +0000
Subject: [Buildroot] [PATCH 1/1] package/wf111: update the upstream URL in
 Config.in
Message-ID: <20191230152421.11701-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in. This
addresses an intermittent 'Invalid(404)' URL status in the
package stats web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/wf111/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wf111/Config.in b/package/wf111/Config.in
index 7b61ea195f..6aaf1b9edb 100644
--- a/package/wf111/Config.in
+++ b/package/wf111/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_WF111
 	    configuration entry that selects them, for example.
 	  - By enabling another random WiFi driver that select them.
 
-	  https://www.silabs.com/products/wireless/wi-fi/wf111-bluegiga-module
+	  https://www.silabs.com/wireless/wi-fi/bluegiga-legacy-modules
 
 comment "wf111 needs a glibc toolchain"
 	depends on BR2_LINUX_KERNEL
-- 
2.20.1
