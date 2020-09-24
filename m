From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 24 Sep 2020 22:57:54 +0200
Subject: [Buildroot] [git commit] package/liburcu: add support for IBM s390x
 and Z arch
Message-ID: <20200924213039.E9B3F80E36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4832d6e459f2f8efbe4137f3567952ff50be1bce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/liburcu/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
index 7d29642084..5dc8528971 100644
--- a/package/liburcu/Config.in
+++ b/package/liburcu/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be || \
 		BR2_i386 || BR2_mips || BR2_mips64 || BR2_mipsel || \
 		BR2_mips64el || BR2_nios2 || BR2_powerpc || BR2_powerpc64 || \
-		BR2_powerpc64le || BR2_riscv || BR2_sparc64 || BR2_x86_64
+		BR2_powerpc64le || BR2_riscv || BR2_sparc64 || BR2_s390x || BR2_x86_64
 	depends on BR2_USE_MMU # fork() in test
 
 config BR2_PACKAGE_LIBURCU
