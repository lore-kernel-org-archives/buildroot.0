From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Mar 2018 23:41:23 +0100
Subject: [Buildroot] [git commit] powerpc-utils: Update URL to new upstream
Message-ID: <20180322230316.22959838A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b383e4bf4151b9232b2e66f0d6ae822546576a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

powerpc-utils changed upstream git repositories again.

Signed-off-by: Joel Stanley <joel@jms.id.au>
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
 
