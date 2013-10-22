From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Oct 2013 10:28:07 +0200
Subject: [Buildroot] [git commit] gcc: bump 4.8.x series to version 4.8.2
Message-ID: <20131022091810.7B3C99BAD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a995cc71f66fafab817ca088f18736cab6e4c48
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/{4.8.1 => 4.8.2}/100-uclibc-conf.patch |    0
 .../{4.8.1 => 4.8.2}/301-missing-execinfo_h.patch  |    0
 .../gcc/{4.8.1 => 4.8.2}/302-c99-snprintf.patch    |    0
 .../305-libmudflap-susv3-legacy.patch              |    0
 .../810-arm-softfloat-libgcc.patch                 |    0
 .../{4.8.1 => 4.8.2}/830-arm_unbreak_armv4t.patch  |    0
 .../powerpc-link-with-math-lib.patch.conditional   |    0
 package/gcc/Config.in.host                         |    2 +-
 8 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gcc/4.8.1/100-uclibc-conf.patch b/package/gcc/4.8.2/100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/4.8.1/100-uclibc-conf.patch
rename to package/gcc/4.8.2/100-uclibc-conf.patch
diff --git a/package/gcc/4.8.1/301-missing-execinfo_h.patch b/package/gcc/4.8.2/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/4.8.1/301-missing-execinfo_h.patch
rename to package/gcc/4.8.2/301-missing-execinfo_h.patch
diff --git a/package/gcc/4.8.1/302-c99-snprintf.patch b/package/gcc/4.8.2/302-c99-snprintf.patch
similarity index 100%
rename from package/gcc/4.8.1/302-c99-snprintf.patch
rename to package/gcc/4.8.2/302-c99-snprintf.patch
diff --git a/package/gcc/4.8.1/305-libmudflap-susv3-legacy.patch b/package/gcc/4.8.2/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from package/gcc/4.8.1/305-libmudflap-susv3-legacy.patch
rename to package/gcc/4.8.2/305-libmudflap-susv3-legacy.patch
diff --git a/package/gcc/4.8.1/810-arm-softfloat-libgcc.patch b/package/gcc/4.8.2/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from package/gcc/4.8.1/810-arm-softfloat-libgcc.patch
rename to package/gcc/4.8.2/810-arm-softfloat-libgcc.patch
diff --git a/package/gcc/4.8.1/830-arm_unbreak_armv4t.patch b/package/gcc/4.8.2/830-arm_unbreak_armv4t.patch
similarity index 100%
rename from package/gcc/4.8.1/830-arm_unbreak_armv4t.patch
rename to package/gcc/4.8.2/830-arm_unbreak_armv4t.patch
diff --git a/package/gcc/4.8.1/powerpc-link-with-math-lib.patch.conditional b/package/gcc/4.8.2/powerpc-link-with-math-lib.patch.conditional
similarity index 100%
rename from package/gcc/4.8.1/powerpc-link-with-math-lib.patch.conditional
rename to package/gcc/4.8.2/powerpc-link-with-math-lib.patch.conditional
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 1fd3a94..bd2ad8c 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -89,7 +89,7 @@ config BR2_GCC_VERSION
 	default "4.5.4"     if BR2_GCC_VERSION_4_5_X
 	default "4.6.4"     if BR2_GCC_VERSION_4_6_X
 	default "4.7.3"     if BR2_GCC_VERSION_4_7_X
-	default "4.8.1"     if BR2_GCC_VERSION_4_8_X
+	default "4.8.2"     if BR2_GCC_VERSION_4_8_X
 	default "4.8-arc"   if BR2_GCC_VERSION_4_8_ARC
 	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
