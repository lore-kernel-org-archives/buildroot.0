From: Mark Corbin <mark@dibsco.co.uk>
Date: Wed, 18 Dec 2019 13:27:36 +0000
Subject: [Buildroot] [PATCH 1/1] package/tcping: update the upstream URL in
 Config.in
Message-ID: <20191218132736.8052-1-mark@dibsco.co.uk>
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
 package/tcping/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tcping/Config.in b/package/tcping/Config.in
index e72df096c3..241561ce10 100644
--- a/package/tcping/Config.in
+++ b/package/tcping/Config.in
@@ -11,4 +11,4 @@ config BR2_PACKAGE_TCPING
 	  desired port is reachable and then start connection
 	  establishment.
 
-	  http://linuxco.de/tcping/tcping.html
+	  https://web.archive.org/web/20171102193822/linuxco.de/tcping/tcping.html
-- 
2.20.1
