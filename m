From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu,  6 Feb 2014 15:06:22 +0100
Subject: [Buildroot] [PATCH 1/1] uclibc/Config.in: indentation cleanup
Message-ID: <1391695582-30821-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/uclibc/Config.in |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 0565ee9..f5543cc 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -35,7 +35,7 @@ config BR2_USE_UCLIBC_SNAPSHOT
 	default "snapshot"
 	depends on BR2_UCLIBC_VERSION_SNAPSHOT
 	help
-	    Use latest snapshot or one from a specific date?
+	  Use latest snapshot or one from a specific date?
 
 config BR2_UCLIBC_VERSION_STRING
 	string
@@ -115,11 +115,11 @@ choice
 		bool "linuxthreads"
 		depends on !BR2_bfin
 		depends on !BR2_xtensa
-	        select BR2_TOOLCHAIN_HAS_THREADS
+		select BR2_TOOLCHAIN_HAS_THREADS
 
 	config BR2_PTHREADS_OLD
 		bool "linuxthreads (stable/old)"
-	        select BR2_TOOLCHAIN_HAS_THREADS
+		select BR2_TOOLCHAIN_HAS_THREADS
 
 	config BR2_PTHREADS_NATIVE
 		bool "Native POSIX Threading (NPTL)"
-- 
1.7.9.5
