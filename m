From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 18:36:03 +0100
Subject: [Buildroot] [git commit] jpeg: fix typo introduced when fixing the
	indentation
Message-ID: <20161211173622.880F881831@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09d48dce0a75e93d560d129ca5f3883650ee63bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jpeg/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
index 2bcf405..8de45a3 100644
--- a/package/jpeg/Config.in
+++ b/package/jpeg/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_JPEG
 config BR2_PACKAGE_JPEG_SIMD_SUPPORT
        bool
        default y if BR2_X86_CPU_HAS_MMX || BR2_ARM_CPU_HAS_NEON || \
-		 BR2_POWERPC_CPU_HAS_ALTIVEC
+		 BR2_POWERPC_CPU_HAS_ALTIVEC || \
 		 BR2_aarch64 || BR2_aarch64_be
 
 if BR2_PACKAGE_JPEG
