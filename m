From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 17:03:41 +0200
Subject: [Buildroot] [git commit] package/jemalloc: indentation cleanup
Message-ID: <20160715150352.55BBC7FE8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a121757f855790db2fbbfe7ba35dc9e88163a678
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
