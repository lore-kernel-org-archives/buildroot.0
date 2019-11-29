From: Mark Corbin <mark@dibsco.co.uk>
Date: Fri, 29 Nov 2019 15:20:25 +0000
Subject: [Buildroot] [PATCH 1/1] package/mxsldr: update the upstream URL in
 Config.in
Message-ID: <20191129152025.9068-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/mxsldr/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mxsldr/Config.in.host b/package/mxsldr/Config.in.host
index a427e71cf7..0a02877c8b 100644
--- a/package/mxsldr/Config.in.host
+++ b/package/mxsldr/Config.in.host
@@ -6,4 +6,4 @@ config BR2_PACKAGE_HOST_MXSLDR
 	  Freescale i.MX23 and i.MX28 SoC's through the Serial
 	  Download Protocol.
 
-	  git://git.denx.de/mxsldr.git
+	  https://gitlab.denx.de/denx/mxsldr
-- 
2.20.1
