From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Apr 2018 16:44:23 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] powerpc-utils: Update URL
 to new upstream
Message-ID: <20180406165913.4A24183B4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e63590fe2e36816e947fee781b99aa6ffba7787
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

powerpc-utils changed upstream git repositories again.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1b383e4bf4151b9232b2e66f0d6ae822546576a5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/powerpc-utils/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/powerpc-utils/Config.in b/package/powerpc-utils/Config.in
index b0ca84789e..d04d81c08a 100644
--- a/package/powerpc-utils/Config.in
+++ b/package/powerpc-utils/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_POWERPC_UTILS
 	help
 	  System utilities for PowerPC machines.
 
-	  https://github.com/nfont/powerpc-utils
+	  https://github.com/ibm-power-utilities/powerpc-utils.git
 
 if BR2_PACKAGE_POWERPC_UTILS
 
