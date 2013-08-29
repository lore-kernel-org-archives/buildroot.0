From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 29 Aug 2013 12:45:49 +0300
Subject: [Buildroot] [PATCH] kexec: fix homepage URL
Message-ID: <55a83a761406884809ad994d8076b3d89c94c7a3.1377769486.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The old one gives 404 error.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/kexec/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index 6f10b89..5eb29cf 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_KEXEC
 	  Kexec is a user space utiltity for loading another kernel
 	  and asking the currently running kernel to do something with it.
 
-	  http://www.kernel.org/pub/linux/kernel/people/horms/kexec-tools/
+	  https://www.kernel.org/pub/linux/utils/kernel/kexec/
 
 config BR2_PACKAGE_KEXEC_ZLIB
 	bool "zlib support"
-- 
1.8.4.rc3
