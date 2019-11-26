From: Mark Corbin <mark@dibsco.co.uk>
Date: Tue, 26 Nov 2019 14:07:26 +0000
Subject: [Buildroot] [PATCH 1/1] package/fastd: update the upstream URL in
 Config.in
Message-ID: <20191126140726.24080-1-mark@dibsco.co.uk>
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
 package/fastd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fastd/Config.in b/package/fastd/Config.in
index 1d0b052bd9..c4f296dd63 100644
--- a/package/fastd/Config.in
+++ b/package/fastd/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_FASTD
 	help
 	  Fast and Secure Tunneling Daemon
 
-	  https://projects.universe-factory.net/projects/fastd/wiki
+	  https://github.com/NeoRaider/fastd/wiki
 
 if BR2_PACKAGE_FASTD
 
-- 
2.20.1
