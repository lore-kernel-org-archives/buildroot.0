From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 22:09:43 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/mxsldr: update
 the upstream URL in Config.in
Message-ID: <20191205210734.4F6548812B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=235041f60ade62a3f13e78b76e6653eebc3a2936
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3fa37a41d87a20302a53124baeb2feddc94466c6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
