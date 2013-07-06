From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Jul 2013 22:48:40 +0200
Subject: [Buildroot] [PATCH 01/12] package/uclibc: fix indentation (use tabs,
	not spaces)
In-Reply-To: <cover.1373143368.git.yann.morin.1998@free.fr>
References: <cover.1373143368.git.yann.morin.1998@free.fr>
Message-ID: <6fe8e87409ee74b438aeefda9767b16fe7522146.1373143368.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/uclibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index f309243..e508342 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -113,7 +113,7 @@ choice
 
 	config BR2_PTHREADS_NATIVE
 		bool "Native POSIX Threading (NPTL)"
-	        select BR2_TOOLCHAIN_HAS_THREADS
+		select BR2_TOOLCHAIN_HAS_THREADS
 		depends on !BR2_ARM_OABI
 		depends on !BR2_x86_i386
 		depends on !BR2_avr32
-- 
1.8.1.2
