From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Oct 2010 09:08:08 +0200
Subject: [Buildroot] [git commit master 1/1] toolchain/gcc: bump 4.4.x
	version
Message-ID: <20101004071613.D06B88B8B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1f0302f967dd2816c6df63ff75921e487f7c45e6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gcc/{4.4.4 => 4.4.5}/100-uclibc-conf.patch     |    0
 .../{4.4.4 => 4.4.5}/301-missing-execinfo_h.patch  |    0
 .../gcc/{4.4.4 => 4.4.5}/302-c99-snprintf.patch    |    0
 .../305-libmudflap-susv3-legacy.patch              |    0
 .../810-arm-softfloat-libgcc.patch                 |    0
 .../powerpc-link-with-math-lib.patch.conditional   |    0
 toolchain/gcc/Config.in                            |    2 +-
 7 files changed, 1 insertions(+), 1 deletions(-)
 rename toolchain/gcc/{4.4.4 => 4.4.5}/100-uclibc-conf.patch (100%)
 rename toolchain/gcc/{4.4.4 => 4.4.5}/301-missing-execinfo_h.patch (100%)
 rename toolchain/gcc/{4.4.4 => 4.4.5}/302-c99-snprintf.patch (100%)
 rename toolchain/gcc/{4.4.4 => 4.4.5}/305-libmudflap-susv3-legacy.patch (100%)
 rename toolchain/gcc/{4.4.4 => 4.4.5}/810-arm-softfloat-libgcc.patch (100%)
 rename toolchain/gcc/{4.4.4 => 4.4.5}/powerpc-link-with-math-lib.patch.conditional (100%)

diff --git a/toolchain/gcc/4.4.4/100-uclibc-conf.patch b/toolchain/gcc/4.4.5/100-uclibc-conf.patch
similarity index 100%
rename from toolchain/gcc/4.4.4/100-uclibc-conf.patch
rename to toolchain/gcc/4.4.5/100-uclibc-conf.patch
diff --git a/toolchain/gcc/4.4.4/301-missing-execinfo_h.patch b/toolchain/gcc/4.4.5/301-missing-execinfo_h.patch
similarity index 100%
rename from toolchain/gcc/4.4.4/301-missing-execinfo_h.patch
rename to toolchain/gcc/4.4.5/301-missing-execinfo_h.patch
diff --git a/toolchain/gcc/4.4.4/302-c99-snprintf.patch b/toolchain/gcc/4.4.5/302-c99-snprintf.patch
similarity index 100%
rename from toolchain/gcc/4.4.4/302-c99-snprintf.patch
rename to toolchain/gcc/4.4.5/302-c99-snprintf.patch
diff --git a/toolchain/gcc/4.4.4/305-libmudflap-susv3-legacy.patch b/toolchain/gcc/4.4.5/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from toolchain/gcc/4.4.4/305-libmudflap-susv3-legacy.patch
rename to toolchain/gcc/4.4.5/305-libmudflap-susv3-legacy.patch
diff --git a/toolchain/gcc/4.4.4/810-arm-softfloat-libgcc.patch b/toolchain/gcc/4.4.5/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from toolchain/gcc/4.4.4/810-arm-softfloat-libgcc.patch
rename to toolchain/gcc/4.4.5/810-arm-softfloat-libgcc.patch
diff --git a/toolchain/gcc/4.4.4/powerpc-link-with-math-lib.patch.conditional b/toolchain/gcc/4.4.5/powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from toolchain/gcc/4.4.4/powerpc-link-with-math-lib.patch.conditional
rename to toolchain/gcc/4.4.5/powerpc-link-with-math-lib.patch.conditional
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 760bb98..8d761c3 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -47,7 +47,7 @@ config BR2_GCC_VERSION
 	default "4.2.2-avr32-2.1.5" if BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
 	default "4.2.4"     if BR2_GCC_VERSION_4_2_4
 	default "4.3.5"     if BR2_GCC_VERSION_4_3_X
-	default "4.4.4"     if BR2_GCC_VERSION_4_4_X
+	default "4.4.5"     if BR2_GCC_VERSION_4_4_X
 	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
-- 
1.7.1
