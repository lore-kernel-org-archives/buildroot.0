From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri,  8 Jul 2016 22:10:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/jemalloc: indentation cleanup
Message-ID: <1468008608-16286-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/jemalloc/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jemalloc/Config.in b/package/jemalloc/Config.in
index a9999ba..f5ee950 100644
--- a/package/jemalloc/Config.in
+++ b/package/jemalloc/Config.in
@@ -13,10 +13,10 @@ config BR2_PACKAGE_JEMALLOC
 	depends on BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS
 	help
-	 This library providing a malloc(3) implementation that emphasizes
-	 fragmentation avoidance and scalable concurrency support.
+	  This library providing a malloc(3) implementation that emphasizes
+	  fragmentation avoidance and scalable concurrency support.
 
-	 http://www.canonware.com/jemalloc/
+	  http://www.canonware.com/jemalloc/
 
 comment "jemalloc needs a toolchain w/ dynamic library"
 	depends on BR2_PACKAGE_JEMALLOC_ARCH_SUPPORTS
-- 
1.9.1
