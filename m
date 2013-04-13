From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 13 Apr 2013 09:40:01 +0200
Subject: [Buildroot] [git commit] toolchain/gcc: bump 4.6.x version
Message-ID: <20130413073944.C9D839B5D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f452bf11c5912ec29c208c44162e3255bcd56d7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gcc/{4.6.3 => 4.6.4}/100-uclibc-conf.patch     |    0
 .../{4.6.3 => 4.6.4}/301-missing-execinfo_h.patch  |    0
 .../gcc/{4.6.3 => 4.6.4}/302-c99-snprintf.patch    |    0
 .../305-libmudflap-susv3-legacy.patch              |    0
 .../810-arm-softfloat-libgcc.patch                 |    0
 .../{4.6.3 => 4.6.4}/820-arm-unbreak-armv4t.patch  |    0
 .../powerpc-link-with-math-lib.patch.conditional   |    0
 toolchain/gcc/Config.in                            |    2 +-
 8 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/gcc/4.6.3/100-uclibc-conf.patch b/toolchain/gcc/4.6.4/100-uclibc-conf.patch
similarity index 100%
rename from toolchain/gcc/4.6.3/100-uclibc-conf.patch
rename to toolchain/gcc/4.6.4/100-uclibc-conf.patch
diff --git a/toolchain/gcc/4.6.3/301-missing-execinfo_h.patch b/toolchain/gcc/4.6.4/301-missing-execinfo_h.patch
similarity index 100%
rename from toolchain/gcc/4.6.3/301-missing-execinfo_h.patch
rename to toolchain/gcc/4.6.4/301-missing-execinfo_h.patch
diff --git a/toolchain/gcc/4.6.3/302-c99-snprintf.patch b/toolchain/gcc/4.6.4/302-c99-snprintf.patch
similarity index 100%
rename from toolchain/gcc/4.6.3/302-c99-snprintf.patch
rename to toolchain/gcc/4.6.4/302-c99-snprintf.patch
diff --git a/toolchain/gcc/4.6.3/305-libmudflap-susv3-legacy.patch b/toolchain/gcc/4.6.4/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from toolchain/gcc/4.6.3/305-libmudflap-susv3-legacy.patch
rename to toolchain/gcc/4.6.4/305-libmudflap-susv3-legacy.patch
diff --git a/toolchain/gcc/4.6.3/810-arm-softfloat-libgcc.patch b/toolchain/gcc/4.6.4/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from toolchain/gcc/4.6.3/810-arm-softfloat-libgcc.patch
rename to toolchain/gcc/4.6.4/810-arm-softfloat-libgcc.patch
diff --git a/toolchain/gcc/4.6.3/820-arm-unbreak-armv4t.patch b/toolchain/gcc/4.6.4/820-arm-unbreak-armv4t.patch
similarity index 100%
rename from toolchain/gcc/4.6.3/820-arm-unbreak-armv4t.patch
rename to toolchain/gcc/4.6.4/820-arm-unbreak-armv4t.patch
diff --git a/toolchain/gcc/4.6.3/powerpc-link-with-math-lib.patch.conditional b/toolchain/gcc/4.6.4/powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from toolchain/gcc/4.6.3/powerpc-link-with-math-lib.patch.conditional
rename to toolchain/gcc/4.6.4/powerpc-link-with-math-lib.patch.conditional
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 5dd37ce..d7e8715 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -75,7 +75,7 @@ config BR2_GCC_VERSION
 	default "4.3.6"     if BR2_GCC_VERSION_4_3_X
 	default "4.4.7"     if BR2_GCC_VERSION_4_4_X
 	default "4.5.4"     if BR2_GCC_VERSION_4_5_X
-	default "4.6.3"     if BR2_GCC_VERSION_4_6_X
+	default "4.6.4"     if BR2_GCC_VERSION_4_6_X
 	default "4.7.3"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.0"     if BR2_GCC_VERSION_4_8_X
 	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
