From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 13 Mar 2012 16:27:25 +0100
Subject: [Buildroot] [git commit] gcc: bump 4.4.x version
Message-ID: <20120313152814.ECAF890D79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e687bb71a028303f326aeebfaf94a3ac1c43b4e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gcc/{4.4.6 => 4.4.7}/100-uclibc-conf.patch     |    0
 .../{4.4.6 => 4.4.7}/301-missing-execinfo_h.patch  |    0
 .../gcc/{4.4.6 => 4.4.7}/302-c99-snprintf.patch    |    0
 .../305-libmudflap-susv3-legacy.patch              |    0
 .../810-arm-softfloat-libgcc.patch                 |    0
 .../gcc/{4.4.6 => 4.4.7}/950-sparc-leon.patch      |    0
 .../gcc/{4.4.6 => 4.4.7}/gcc-44-pr39429.patch      |    0
 .../powerpc-link-with-math-lib.patch.conditional   |    0
 toolchain/gcc/Config.in                            |    2 +-
 9 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/gcc/4.4.6/100-uclibc-conf.patch b/toolchain/gcc/4.4.7/100-uclibc-conf.patch
similarity index 100%
rename from toolchain/gcc/4.4.6/100-uclibc-conf.patch
rename to toolchain/gcc/4.4.7/100-uclibc-conf.patch
diff --git a/toolchain/gcc/4.4.6/301-missing-execinfo_h.patch b/toolchain/gcc/4.4.7/301-missing-execinfo_h.patch
similarity index 100%
rename from toolchain/gcc/4.4.6/301-missing-execinfo_h.patch
rename to toolchain/gcc/4.4.7/301-missing-execinfo_h.patch
diff --git a/toolchain/gcc/4.4.6/302-c99-snprintf.patch b/toolchain/gcc/4.4.7/302-c99-snprintf.patch
similarity index 100%
rename from toolchain/gcc/4.4.6/302-c99-snprintf.patch
rename to toolchain/gcc/4.4.7/302-c99-snprintf.patch
diff --git a/toolchain/gcc/4.4.6/305-libmudflap-susv3-legacy.patch b/toolchain/gcc/4.4.7/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from toolchain/gcc/4.4.6/305-libmudflap-susv3-legacy.patch
rename to toolchain/gcc/4.4.7/305-libmudflap-susv3-legacy.patch
diff --git a/toolchain/gcc/4.4.6/810-arm-softfloat-libgcc.patch b/toolchain/gcc/4.4.7/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from toolchain/gcc/4.4.6/810-arm-softfloat-libgcc.patch
rename to toolchain/gcc/4.4.7/810-arm-softfloat-libgcc.patch
diff --git a/toolchain/gcc/4.4.6/950-sparc-leon.patch b/toolchain/gcc/4.4.7/950-sparc-leon.patch
similarity index 100%
rename from toolchain/gcc/4.4.6/950-sparc-leon.patch
rename to toolchain/gcc/4.4.7/950-sparc-leon.patch
diff --git a/toolchain/gcc/4.4.6/gcc-44-pr39429.patch b/toolchain/gcc/4.4.7/gcc-44-pr39429.patch
similarity index 100%
rename from toolchain/gcc/4.4.6/gcc-44-pr39429.patch
rename to toolchain/gcc/4.4.7/gcc-44-pr39429.patch
diff --git a/toolchain/gcc/4.4.6/powerpc-link-with-math-lib.patch.conditional b/toolchain/gcc/4.4.7/powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from toolchain/gcc/4.4.6/powerpc-link-with-math-lib.patch.conditional
rename to toolchain/gcc/4.4.7/powerpc-link-with-math-lib.patch.conditional
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 349d9df..a4ca054 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -57,7 +57,7 @@ config BR2_GCC_VERSION
 	string
 	default "4.2.2-avr32-2.1.5" if BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
 	default "4.3.6"     if BR2_GCC_VERSION_4_3_X
-	default "4.4.6"     if BR2_GCC_VERSION_4_4_X
+	default "4.4.7"     if BR2_GCC_VERSION_4_4_X
 	default "4.5.3"     if BR2_GCC_VERSION_4_5_X
 	default "4.6.3"     if BR2_GCC_VERSION_4_6_X
 	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
