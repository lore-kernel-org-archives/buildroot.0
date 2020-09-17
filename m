From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Thu, 17 Sep 2020 06:07:58 +0200
Subject: [Buildroot] [PATCH v4 08/12] package/liburcu: add support for IBM
 s390x and Z arch
In-Reply-To: <20200917040802.846896-1-egorenar@linux.ibm.com>
References: <20200917040802.846896-1-egorenar@linux.ibm.com>
Message-ID: <20200917040802.846896-9-egorenar@linux.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
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
-- 
2.26.2
