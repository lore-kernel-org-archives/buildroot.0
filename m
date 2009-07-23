From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 23 Jul 2009 13:15:05 +0200
Subject: [Buildroot] [git commit] toolchain/gcc: bump 4.4.x version
Message-ID: <20090723113643.989EC777DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f917e6b21b262b6fb7ff363f6c7b217bb653d97c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../gcc/{4.4.0 => 4.4.1}/100-uclibc-conf.patch     |    0
 .../{4.4.0 => 4.4.1}/301-missing-execinfo_h.patch  |    0
 .../gcc/{4.4.0 => 4.4.1}/302-c99-snprintf.patch    |    0
 .../305-libmudflap-susv3-legacy.patch              |    0
 .../810-arm-softfloat-libgcc.patch                 |    0
 toolchain/gcc/Config.in                            |    2 +-
 6 files changed, 1 insertions(+), 1 deletions(-)
 rename toolchain/gcc/{4.4.0 => 4.4.1}/100-uclibc-conf.patch (100%)
 rename toolchain/gcc/{4.4.0 => 4.4.1}/301-missing-execinfo_h.patch (100%)
 rename toolchain/gcc/{4.4.0 => 4.4.1}/302-c99-snprintf.patch (100%)
 rename toolchain/gcc/{4.4.0 => 4.4.1}/305-libmudflap-susv3-legacy.patch (100%)
 rename toolchain/gcc/{4.4.0 => 4.4.1}/810-arm-softfloat-libgcc.patch (100%)

diff --git a/toolchain/gcc/4.4.0/100-uclibc-conf.patch b/toolchain/gcc/4.4.1/100-uclibc-conf.patch
similarity index 100%
rename from toolchain/gcc/4.4.0/100-uclibc-conf.patch
rename to toolchain/gcc/4.4.1/100-uclibc-conf.patch
diff --git a/toolchain/gcc/4.4.0/301-missing-execinfo_h.patch b/toolchain/gcc/4.4.1/301-missing-execinfo_h.patch
similarity index 100%
rename from toolchain/gcc/4.4.0/301-missing-execinfo_h.patch
rename to toolchain/gcc/4.4.1/301-missing-execinfo_h.patch
diff --git a/toolchain/gcc/4.4.0/302-c99-snprintf.patch b/toolchain/gcc/4.4.1/302-c99-snprintf.patch
similarity index 100%
rename from toolchain/gcc/4.4.0/302-c99-snprintf.patch
rename to toolchain/gcc/4.4.1/302-c99-snprintf.patch
diff --git a/toolchain/gcc/4.4.0/305-libmudflap-susv3-legacy.patch b/toolchain/gcc/4.4.1/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from toolchain/gcc/4.4.0/305-libmudflap-susv3-legacy.patch
rename to toolchain/gcc/4.4.1/305-libmudflap-susv3-legacy.patch
diff --git a/toolchain/gcc/4.4.0/810-arm-softfloat-libgcc.patch b/toolchain/gcc/4.4.1/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from toolchain/gcc/4.4.0/810-arm-softfloat-libgcc.patch
rename to toolchain/gcc/4.4.1/810-arm-softfloat-libgcc.patch
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 9aba2f7..76e7f78 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -105,7 +105,7 @@ config BR2_GCC_VERSION
 	default "4.3.1"     if BR2_GCC_VERSION_4_3_1
 	default "4.3.2"     if BR2_GCC_VERSION_4_3_2
 	default "4.3.3"     if BR2_GCC_VERSION_4_3_3
-	default "4.4.0"     if BR2_GCC_VERSION_4_4_X
+	default "4.4.1"     if BR2_GCC_VERSION_4_4_X
 	default "4.3"       if BR2_GCC_VERSION_4_3
 
 config BR2_TOOLCHAIN_SYSROOT
-- 
1.6.3.3
