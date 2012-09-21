From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 21 Sep 2012 07:29:54 +0200
Subject: [Buildroot] [git commit] gcc: bump 4.7.x version
Message-ID: <20120921053034.B08F3996A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6fdc695128581a8d2e177997145e2aa075d5fb9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gcc/{4.7.1 => 4.7.2}/100-uclibc-conf.patch     |    0
 .../{4.7.1 => 4.7.2}/301-missing-execinfo_h.patch  |    0
 .../gcc/{4.7.1 => 4.7.2}/302-c99-snprintf.patch    |    0
 .../305-libmudflap-susv3-legacy.patch              |    0
 .../810-arm-softfloat-libgcc.patch                 |    0
 .../{4.7.1 => 4.7.2}/830-arm_unbreak_armv4t.patch  |    0
 .../powerpc-link-with-math-lib.patch.conditional   |    0
 toolchain/gcc/Config.in                            |    2 +-
 8 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/gcc/4.7.1/100-uclibc-conf.patch b/toolchain/gcc/4.7.2/100-uclibc-conf.patch
similarity index 100%
rename from toolchain/gcc/4.7.1/100-uclibc-conf.patch
rename to toolchain/gcc/4.7.2/100-uclibc-conf.patch
diff --git a/toolchain/gcc/4.7.1/301-missing-execinfo_h.patch b/toolchain/gcc/4.7.2/301-missing-execinfo_h.patch
similarity index 100%
rename from toolchain/gcc/4.7.1/301-missing-execinfo_h.patch
rename to toolchain/gcc/4.7.2/301-missing-execinfo_h.patch
diff --git a/toolchain/gcc/4.7.1/302-c99-snprintf.patch b/toolchain/gcc/4.7.2/302-c99-snprintf.patch
similarity index 100%
rename from toolchain/gcc/4.7.1/302-c99-snprintf.patch
rename to toolchain/gcc/4.7.2/302-c99-snprintf.patch
diff --git a/toolchain/gcc/4.7.1/305-libmudflap-susv3-legacy.patch b/toolchain/gcc/4.7.2/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from toolchain/gcc/4.7.1/305-libmudflap-susv3-legacy.patch
rename to toolchain/gcc/4.7.2/305-libmudflap-susv3-legacy.patch
diff --git a/toolchain/gcc/4.7.1/810-arm-softfloat-libgcc.patch b/toolchain/gcc/4.7.2/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from toolchain/gcc/4.7.1/810-arm-softfloat-libgcc.patch
rename to toolchain/gcc/4.7.2/810-arm-softfloat-libgcc.patch
diff --git a/toolchain/gcc/4.7.1/830-arm_unbreak_armv4t.patch b/toolchain/gcc/4.7.2/830-arm_unbreak_armv4t.patch
similarity index 100%
rename from toolchain/gcc/4.7.1/830-arm_unbreak_armv4t.patch
rename to toolchain/gcc/4.7.2/830-arm_unbreak_armv4t.patch
diff --git a/toolchain/gcc/4.7.1/powerpc-link-with-math-lib.patch.conditional b/toolchain/gcc/4.7.2/powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from toolchain/gcc/4.7.1/powerpc-link-with-math-lib.patch.conditional
rename to toolchain/gcc/4.7.2/powerpc-link-with-math-lib.patch.conditional
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index a67e7b0..6456502 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -64,7 +64,7 @@ config BR2_GCC_VERSION
 	default "4.4.7"     if BR2_GCC_VERSION_4_4_X
 	default "4.5.4"     if BR2_GCC_VERSION_4_5_X
 	default "4.6.3"     if BR2_GCC_VERSION_4_6_X
-	default "4.7.1"     if BR2_GCC_VERSION_4_7_X
+	default "4.7.2"     if BR2_GCC_VERSION_4_7_X
 	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
