From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Jul 2012 21:53:54 +0200
Subject: [Buildroot] [git commit] toolchain/gcc : bump 4.5.x version
Message-ID: <20120702195608.4C8828F6DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8f6fc941c729f069256296f82ed9f721a266cc8c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gcc/{4.5.3 => 4.5.4}/100-uclibc-conf.patch     |    0
 .../{4.5.3 => 4.5.4}/301-missing-execinfo_h.patch  |    0
 .../gcc/{4.5.3 => 4.5.4}/302-c99-snprintf.patch    |    0
 .../305-libmudflap-susv3-legacy.patch              |    0
 .../810-arm-softfloat-libgcc.patch                 |    0
 .../{4.5.3 => 4.5.4}/820-arm-unbreak-armv4t.patch  |    0
 .../gcc/{4.5.3 => 4.5.4}/830-arm-pr43440.patch     |    0
 .../powerpc-link-with-math-lib.patch.conditional   |    0
 toolchain/gcc/Config.in                            |    2 +-
 9 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/gcc/4.5.3/100-uclibc-conf.patch b/toolchain/gcc/4.5.4/100-uclibc-conf.patch
similarity index 100%
rename from toolchain/gcc/4.5.3/100-uclibc-conf.patch
rename to toolchain/gcc/4.5.4/100-uclibc-conf.patch
diff --git a/toolchain/gcc/4.5.3/301-missing-execinfo_h.patch b/toolchain/gcc/4.5.4/301-missing-execinfo_h.patch
similarity index 100%
rename from toolchain/gcc/4.5.3/301-missing-execinfo_h.patch
rename to toolchain/gcc/4.5.4/301-missing-execinfo_h.patch
diff --git a/toolchain/gcc/4.5.3/302-c99-snprintf.patch b/toolchain/gcc/4.5.4/302-c99-snprintf.patch
similarity index 100%
rename from toolchain/gcc/4.5.3/302-c99-snprintf.patch
rename to toolchain/gcc/4.5.4/302-c99-snprintf.patch
diff --git a/toolchain/gcc/4.5.3/305-libmudflap-susv3-legacy.patch b/toolchain/gcc/4.5.4/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from toolchain/gcc/4.5.3/305-libmudflap-susv3-legacy.patch
rename to toolchain/gcc/4.5.4/305-libmudflap-susv3-legacy.patch
diff --git a/toolchain/gcc/4.5.3/810-arm-softfloat-libgcc.patch b/toolchain/gcc/4.5.4/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from toolchain/gcc/4.5.3/810-arm-softfloat-libgcc.patch
rename to toolchain/gcc/4.5.4/810-arm-softfloat-libgcc.patch
diff --git a/toolchain/gcc/4.5.3/820-arm-unbreak-armv4t.patch b/toolchain/gcc/4.5.4/820-arm-unbreak-armv4t.patch
similarity index 100%
rename from toolchain/gcc/4.5.3/820-arm-unbreak-armv4t.patch
rename to toolchain/gcc/4.5.4/820-arm-unbreak-armv4t.patch
diff --git a/toolchain/gcc/4.5.3/830-arm-pr43440.patch b/toolchain/gcc/4.5.4/830-arm-pr43440.patch
similarity index 100%
rename from toolchain/gcc/4.5.3/830-arm-pr43440.patch
rename to toolchain/gcc/4.5.4/830-arm-pr43440.patch
diff --git a/toolchain/gcc/4.5.3/powerpc-link-with-math-lib.patch.conditional b/toolchain/gcc/4.5.4/powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from toolchain/gcc/4.5.3/powerpc-link-with-math-lib.patch.conditional
rename to toolchain/gcc/4.5.4/powerpc-link-with-math-lib.patch.conditional
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 4ce8816..fa526bb 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -62,7 +62,7 @@ config BR2_GCC_VERSION
 	default "4.2.2-avr32-2.1.5" if BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
 	default "4.3.6"     if BR2_GCC_VERSION_4_3_X
 	default "4.4.7"     if BR2_GCC_VERSION_4_4_X
-	default "4.5.3"     if BR2_GCC_VERSION_4_5_X
+	default "4.5.4"     if BR2_GCC_VERSION_4_5_X
 	default "4.6.3"     if BR2_GCC_VERSION_4_6_X
 	default "4.7.1"     if BR2_GCC_VERSION_4_7_X
 	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
