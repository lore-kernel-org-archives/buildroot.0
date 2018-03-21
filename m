From: Joel Stanley <joel@jms.id.au>
Date: Wed, 21 Mar 2018 13:00:08 +1030
Subject: [Buildroot] [PATCH] powerpc-utils: Update URL to new upstream
Message-ID: <20180321023008.23863-1-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

powerpc-utils changed upstream git repositories again.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 package/powerpc-utils/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/powerpc-utils/Config.in b/package/powerpc-utils/Config.in
index b0ca84789e88..d04d81c08acb 100644
--- a/package/powerpc-utils/Config.in
+++ b/package/powerpc-utils/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_POWERPC_UTILS
 	help
 	  System utilities for PowerPC machines.
 
-	  https://github.com/nfont/powerpc-utils
+	  https://github.com/ibm-power-utilities/powerpc-utils.git
 
 if BR2_PACKAGE_POWERPC_UTILS
 
-- 
2.15.1
