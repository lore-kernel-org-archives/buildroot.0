From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Mar 2016 23:00:20 +0100
Subject: [Buildroot] [git commit] setserial: indentation cleanup
Message-ID: <20160309220856.A98967F8D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb62c266b6c8af3d0a0f031da3e401478d631513
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/setserial/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/setserial/Config.in b/package/setserial/Config.in
index cffe50e..4ff2477 100644
--- a/package/setserial/Config.in
+++ b/package/setserial/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_SETSERIAL
 	# Uses fork()
 	depends on BR2_USE_MMU
 	help
-	     Setserial : configuration of serial ports
+	  Setserial : configuration of serial ports
