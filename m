From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 17:43:33 +0100
Subject: [Buildroot] [git commit branch/next] toolchain/buildroot: forget
	about avr32
Message-ID: <20150214164752.21FE680458@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d3cc4b27f6a2ab9a83feda55d24c117b08d5643
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-buildroot/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
