From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Feb 2015 10:23:08 +0100
Subject: [Buildroot] [PATCH 05/12 v2] toolchain/buildroot: forget about avr32
In-Reply-To: <cover.1423905753.git.yann.morin.1998@free.fr>
References: <cover.1423905753.git.yann.morin.1998@free.fr>
Message-ID: <97f2226289ec287056360f0a9d9329ab9b09d194.1423905753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 toolchain/toolchain-buildroot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 2955b2e..a69013f 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -29,7 +29,7 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	bool "uClibc"
 	select BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_arcle   || BR2_arceb  || BR2_arm    || BR2_armeb    || \
-		   BR2_avr32   || BR2_bfin   || BR2_i386   || BR2_m68k     || \
+		   BR2_bfin    || BR2_i386   || BR2_m68k   || \
 		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
 		   BR2_powerpc || BR2_sh     || BR2_sparc  || BR2_xtensa   || \
 		   BR2_x86_64
-- 
1.9.1
