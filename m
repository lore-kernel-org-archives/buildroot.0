From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 24 Sep 2020 22:57:57 +0200
Subject: [Buildroot] [git commit] package/go: add support for IBM s390x and
 Z arch
Message-ID: <20200924213040.1952D81F58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9eaab4e2c56eb154cf146f6658e28dd58bc11f2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/go/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 3f16dbaec3..87942c7a1e 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
 		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
-		|| BR2_mips64 || BR2_mips64el
+		|| BR2_mips64 || BR2_mips64el || BR2_s390x
 	depends on !BR2_ARM_CPU_ARMV4
 	# MIPS R6 support in Go has not yet been developed.
 	depends on !BR2_MIPS_CPU_MIPS64R6
