From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 31 May 2013 13:57:17 +0200
Subject: [Buildroot] [git commit] gcc: bump 4.8.x version
Message-ID: <20130602212117.044109A6A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed09a3601dd0b594defb6406b5f5816511ad154a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gcc/{4.8.0 => 4.8.1}/100-uclibc-conf.patch     |    0
 .../{4.8.0 => 4.8.1}/301-missing-execinfo_h.patch  |    0
 .../gcc/{4.8.0 => 4.8.1}/302-c99-snprintf.patch    |    0
 .../305-libmudflap-susv3-legacy.patch              |    0
 .../810-arm-softfloat-libgcc.patch                 |    0
 .../{4.8.0 => 4.8.1}/830-arm_unbreak_armv4t.patch  |    0
 .../powerpc-link-with-math-lib.patch.conditional   |    0
 toolchain/gcc/Config.in                            |    2 +-
 8 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/gcc/4.8.0/100-uclibc-conf.patch b/toolchain/gcc/4.8.1/100-uclibc-conf.patch
similarity index 100%
rename from toolchain/gcc/4.8.0/100-uclibc-conf.patch
rename to toolchain/gcc/4.8.1/100-uclibc-conf.patch
diff --git a/toolchain/gcc/4.8.0/301-missing-execinfo_h.patch b/toolchain/gcc/4.8.1/301-missing-execinfo_h.patch
similarity index 100%
rename from toolchain/gcc/4.8.0/301-missing-execinfo_h.patch
rename to toolchain/gcc/4.8.1/301-missing-execinfo_h.patch
diff --git a/toolchain/gcc/4.8.0/302-c99-snprintf.patch b/toolchain/gcc/4.8.1/302-c99-snprintf.patch
similarity index 100%
rename from toolchain/gcc/4.8.0/302-c99-snprintf.patch
rename to toolchain/gcc/4.8.1/302-c99-snprintf.patch
diff --git a/toolchain/gcc/4.8.0/305-libmudflap-susv3-legacy.patch b/toolchain/gcc/4.8.1/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from toolchain/gcc/4.8.0/305-libmudflap-susv3-legacy.patch
rename to toolchain/gcc/4.8.1/305-libmudflap-susv3-legacy.patch
diff --git a/toolchain/gcc/4.8.0/810-arm-softfloat-libgcc.patch b/toolchain/gcc/4.8.1/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from toolchain/gcc/4.8.0/810-arm-softfloat-libgcc.patch
rename to toolchain/gcc/4.8.1/810-arm-softfloat-libgcc.patch
diff --git a/toolchain/gcc/4.8.0/830-arm_unbreak_armv4t.patch b/toolchain/gcc/4.8.1/830-arm_unbreak_armv4t.patch
similarity index 100%
rename from toolchain/gcc/4.8.0/830-arm_unbreak_armv4t.patch
rename to toolchain/gcc/4.8.1/830-arm_unbreak_armv4t.patch
diff --git a/toolchain/gcc/4.8.0/powerpc-link-with-math-lib.patch.conditional b/toolchain/gcc/4.8.1/powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from toolchain/gcc/4.8.0/powerpc-link-with-math-lib.patch.conditional
rename to toolchain/gcc/4.8.1/powerpc-link-with-math-lib.patch.conditional
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index f297e73..fdb19e1 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -83,7 +83,7 @@ config BR2_GCC_VERSION
 	default "4.5.4"     if BR2_GCC_VERSION_4_5_X
 	default "4.6.4"     if BR2_GCC_VERSION_4_6_X
 	default "4.7.3"     if BR2_GCC_VERSION_4_7_X
-	default "4.8.0"     if BR2_GCC_VERSION_4_8_X
+	default "4.8.1"     if BR2_GCC_VERSION_4_8_X
 	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
