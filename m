From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 08:55:56 +0200
Subject: [Buildroot] [git commit] gmp: add explicit dependencies for host
	variant
Message-ID: <20160703065707.2EF417F913@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cec0df7f4f1dc3adac88feee41de0294e60b6809
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gmp/gmp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 09753a0..4557190 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -11,6 +11,7 @@ GMP_INSTALL_STAGING = YES
 GMP_LICENSE = LGPLv3+
 GMP_LICENSE_FILES = COPYING.LESSERv3
 GMP_DEPENDENCIES = host-m4
+HOST_GMP_DEPENDENCIES = host-m4
 
 # GMP doesn't support assembly for coldfire or mips r6 ISA yet
 ifeq ($(BR2_m68k_cf)$(BR2_mips_32r6)$(BR2_mips_64r6),y)
