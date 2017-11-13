From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Nov 2017 14:39:06 +0100
Subject: [Buildroot] [git commit] package/ffmpeg: fix typo "nios" -> "nios2"
Message-ID: <20171113135829.CDAF880DA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8cd840b7e821aa777e835ec11d7a3762f0b33443
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Typo added recently by
https://git.buildroot.net/buildroot/commit/package/ffmpeg?id=bd2544d3d3903935fc4dc0ec9c930720441e545f

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index 487ca44..2d94c57 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW
 	depends on !(BR2_archs38 && BR2_TOOLCHAIN_USES_GLIBC)
 	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
-	depends on !BR2_nios
+	depends on !BR2_nios2
 	# No support for ARMv7-M in the ARM assembly logic
 	depends on !BR2_ARM_CPU_ARMV7M
 	# Microblaze build affected by gcc PR71124 (infinite loop)
