From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Oct 2011 02:23:35 +0200
Subject: [Buildroot] [git commit] toolchain/gcc: bump 4.6.x version to 4.6.2
Message-ID: <20111027132527.C41B08F290@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d04fa9cc676f7584658a41ccf2194a23eb8e0fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gcc/{4.6.1 => 4.6.2}/100-uclibc-conf.patch     |    0
 .../{4.6.1 => 4.6.2}/301-missing-execinfo_h.patch  |    0
 .../gcc/{4.6.1 => 4.6.2}/302-c99-snprintf.patch    |    0
 .../305-libmudflap-susv3-legacy.patch              |    0
 .../810-arm-softfloat-libgcc.patch                 |    0
 .../{4.6.1 => 4.6.2}/820-arm-unbreak-armv4t.patch  |    0
 .../powerpc-link-with-math-lib.patch.conditional   |    0
 toolchain/gcc/Config.in                            |    2 +-
 8 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/gcc/4.6.1/100-uclibc-conf.patch b/toolchain/gcc/4.6.2/100-uclibc-conf.patch
similarity index 100%
rename from toolchain/gcc/4.6.1/100-uclibc-conf.patch
rename to toolchain/gcc/4.6.2/100-uclibc-conf.patch
diff --git a/toolchain/gcc/4.6.1/301-missing-execinfo_h.patch b/toolchain/gcc/4.6.2/301-missing-execinfo_h.patch
similarity index 100%
rename from toolchain/gcc/4.6.1/301-missing-execinfo_h.patch
rename to toolchain/gcc/4.6.2/301-missing-execinfo_h.patch
diff --git a/toolchain/gcc/4.6.1/302-c99-snprintf.patch b/toolchain/gcc/4.6.2/302-c99-snprintf.patch
similarity index 100%
rename from toolchain/gcc/4.6.1/302-c99-snprintf.patch
rename to toolchain/gcc/4.6.2/302-c99-snprintf.patch
diff --git a/toolchain/gcc/4.6.1/305-libmudflap-susv3-legacy.patch b/toolchain/gcc/4.6.2/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from toolchain/gcc/4.6.1/305-libmudflap-susv3-legacy.patch
rename to toolchain/gcc/4.6.2/305-libmudflap-susv3-legacy.patch
diff --git a/toolchain/gcc/4.6.1/810-arm-softfloat-libgcc.patch b/toolchain/gcc/4.6.2/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from toolchain/gcc/4.6.1/810-arm-softfloat-libgcc.patch
rename to toolchain/gcc/4.6.2/810-arm-softfloat-libgcc.patch
diff --git a/toolchain/gcc/4.6.1/820-arm-unbreak-armv4t.patch b/toolchain/gcc/4.6.2/820-arm-unbreak-armv4t.patch
similarity index 100%
rename from toolchain/gcc/4.6.1/820-arm-unbreak-armv4t.patch
rename to toolchain/gcc/4.6.2/820-arm-unbreak-armv4t.patch
diff --git a/toolchain/gcc/4.6.1/powerpc-link-with-math-lib.patch.conditional b/toolchain/gcc/4.6.2/powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from toolchain/gcc/4.6.1/powerpc-link-with-math-lib.patch.conditional
rename to toolchain/gcc/4.6.2/powerpc-link-with-math-lib.patch.conditional
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index cfc7aec..5905262 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -64,7 +64,7 @@ config BR2_GCC_VERSION
 	default "4.3.6"     if BR2_GCC_VERSION_4_3_X
 	default "4.4.6"     if BR2_GCC_VERSION_4_4_X
 	default "4.5.3"     if BR2_GCC_VERSION_4_5_X
-	default "4.6.1"     if BR2_GCC_VERSION_4_6_X
+	default "4.6.2"     if BR2_GCC_VERSION_4_6_X
 	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
