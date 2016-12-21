From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Dec 2016 12:29:53 -0300
Subject: [Buildroot] [PATCH] gcc: bump 6.x series to version 6.3.0
Message-ID: <20161221152953.6286-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/{6.2.0 => 6.3.0}/100-uclibc-conf.patch                    | 0
 package/gcc/{6.2.0 => 6.3.0}/301-missing-execinfo_h.patch             | 0
 package/gcc/{6.2.0 => 6.3.0}/810-arm-softfloat-libgcc.patch           | 0
 package/gcc/{6.2.0 => 6.3.0}/830-arm_unbreak_armv4t.patch             | 0
 .../831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch    | 0
 package/gcc/{6.2.0 => 6.3.0}/860-cilk-wchar.patch                     | 0
 package/gcc/{6.2.0 => 6.3.0}/870-xtensa-Fix-PR-target-78118.patch     | 0
 package/gcc/{6.2.0 => 6.3.0}/871-xtensa-Fix-PR-target-78603.patch     | 0
 package/gcc/{6.2.0 => 6.3.0}/890-fix-m68k-compile.patch               | 0
 package/gcc/{6.2.0 => 6.3.0}/891-fix-m68k-uclinux.patch               | 0
 .../892-libgcc-mkmap-symver-support-skip_underscore.patch             | 0
 .../893-libgcc-config-bfin-use-the-generic-linker-version-in.patch    | 0
 .../894-libgcc-fix-DWARF-compilation-with-FDPIC-targets.patch         | 0
 package/gcc/{6.2.0 => 6.3.0}/895-bfin-define-REENTRANT.patch          | 0
 package/gcc/{6.2.0 => 6.3.0}/940-uclinux-enable-threads.patch         | 0
 .../gcc/{6.2.0 => 6.3.0}/941-mips-Add-support-for-mips-r6-musl.patch  | 0
 package/gcc/Config.in.host                                            | 2 +-
 package/gcc/gcc.hash                                                  | 4 ++--
 18 files changed, 3 insertions(+), 3 deletions(-)
 rename package/gcc/{6.2.0 => 6.3.0}/100-uclibc-conf.patch (100%)
 rename package/gcc/{6.2.0 => 6.3.0}/301-missing-execinfo_h.patch (100%)
 rename package/gcc/{6.2.0 => 6.3.0}/810-arm-softfloat-libgcc.patch (100%)
 rename package/gcc/{6.2.0 => 6.3.0}/830-arm_unbreak_armv4t.patch (100%)
 rename package/gcc/{6.2.0 => 6.3.0}/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch (100%)
 rename package/gcc/{6.2.0 => 6.3.0}/860-cilk-wchar.patch (100%)
 rename package/gcc/{6.2.0 => 6.3.0}/870-xtensa-Fix-PR-target-78118.patch (100%)
 rename package/gcc/{6.2.0 => 6.3.0}/871-xtensa-Fix-PR-target-78603.patch (100%)
 rename package/gcc/{6.2.0 => 6.3.0}/890-fix-m68k-compile.patch (100%)
 rename package/gcc/{6.2.0 => 6.3.0}/891-fix-m68k-uclinux.patch (100%)
 rename package/gcc/{6.2.0 => 6.3.0}/892-libgcc-mkmap-symver-support-skip_underscore.patch (100%)
 rename package/gcc/{6.2.0 => 6.3.0}/893-libgcc-config-bfin-use-the-generic-linker-version-in.patch (100%)
 rename package/gcc/{6.2.0 => 6.3.0}/894-libgcc-fix-DWARF-compilation-with-FDPIC-targets.patch (100%)
 rename package/gcc/{6.2.0 => 6.3.0}/895-bfin-define-REENTRANT.patch (100%)
 rename package/gcc/{6.2.0 => 6.3.0}/940-uclinux-enable-threads.patch (100%)
 rename package/gcc/{6.2.0 => 6.3.0}/941-mips-Add-support-for-mips-r6-musl.patch (100%)

diff --git a/package/gcc/6.2.0/100-uclibc-conf.patch b/package/gcc/6.3.0/100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/6.2.0/100-uclibc-conf.patch
rename to package/gcc/6.3.0/100-uclibc-conf.patch
diff --git a/package/gcc/6.2.0/301-missing-execinfo_h.patch b/package/gcc/6.3.0/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/6.2.0/301-missing-execinfo_h.patch
rename to package/gcc/6.3.0/301-missing-execinfo_h.patch
diff --git a/package/gcc/6.2.0/810-arm-softfloat-libgcc.patch b/package/gcc/6.3.0/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from package/gcc/6.2.0/810-arm-softfloat-libgcc.patch
rename to package/gcc/6.3.0/810-arm-softfloat-libgcc.patch
diff --git a/package/gcc/6.2.0/830-arm_unbreak_armv4t.patch b/package/gcc/6.3.0/830-arm_unbreak_armv4t.patch
similarity index 100%
rename from package/gcc/6.2.0/830-arm_unbreak_armv4t.patch
rename to package/gcc/6.3.0/830-arm_unbreak_armv4t.patch
diff --git a/package/gcc/6.2.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch b/package/gcc/6.3.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch
similarity index 100%
rename from package/gcc/6.2.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch
rename to package/gcc/6.3.0/831-ARM-PR-target-70473-Reduce-size-of-Cortex-A8-automat.patch
diff --git a/package/gcc/6.2.0/860-cilk-wchar.patch b/package/gcc/6.3.0/860-cilk-wchar.patch
similarity index 100%
rename from package/gcc/6.2.0/860-cilk-wchar.patch
rename to package/gcc/6.3.0/860-cilk-wchar.patch
diff --git a/package/gcc/6.2.0/870-xtensa-Fix-PR-target-78118.patch b/package/gcc/6.3.0/870-xtensa-Fix-PR-target-78118.patch
similarity index 100%
rename from package/gcc/6.2.0/870-xtensa-Fix-PR-target-78118.patch
rename to package/gcc/6.3.0/870-xtensa-Fix-PR-target-78118.patch
diff --git a/package/gcc/6.2.0/871-xtensa-Fix-PR-target-78603.patch b/package/gcc/6.3.0/871-xtensa-Fix-PR-target-78603.patch
similarity index 100%
rename from package/gcc/6.2.0/871-xtensa-Fix-PR-target-78603.patch
rename to package/gcc/6.3.0/871-xtensa-Fix-PR-target-78603.patch
diff --git a/package/gcc/6.2.0/890-fix-m68k-compile.patch b/package/gcc/6.3.0/890-fix-m68k-compile.patch
similarity index 100%
rename from package/gcc/6.2.0/890-fix-m68k-compile.patch
rename to package/gcc/6.3.0/890-fix-m68k-compile.patch
diff --git a/package/gcc/6.2.0/891-fix-m68k-uclinux.patch b/package/gcc/6.3.0/891-fix-m68k-uclinux.patch
similarity index 100%
rename from package/gcc/6.2.0/891-fix-m68k-uclinux.patch
rename to package/gcc/6.3.0/891-fix-m68k-uclinux.patch
diff --git a/package/gcc/6.2.0/892-libgcc-mkmap-symver-support-skip_underscore.patch b/package/gcc/6.3.0/892-libgcc-mkmap-symver-support-skip_underscore.patch
similarity index 100%
rename from package/gcc/6.2.0/892-libgcc-mkmap-symver-support-skip_underscore.patch
rename to package/gcc/6.3.0/892-libgcc-mkmap-symver-support-skip_underscore.patch
diff --git a/package/gcc/6.2.0/893-libgcc-config-bfin-use-the-generic-linker-version-in.patch b/package/gcc/6.3.0/893-libgcc-config-bfin-use-the-generic-linker-version-in.patch
similarity index 100%
rename from package/gcc/6.2.0/893-libgcc-config-bfin-use-the-generic-linker-version-in.patch
rename to package/gcc/6.3.0/893-libgcc-config-bfin-use-the-generic-linker-version-in.patch
diff --git a/package/gcc/6.2.0/894-libgcc-fix-DWARF-compilation-with-FDPIC-targets.patch b/package/gcc/6.3.0/894-libgcc-fix-DWARF-compilation-with-FDPIC-targets.patch
similarity index 100%
rename from package/gcc/6.2.0/894-libgcc-fix-DWARF-compilation-with-FDPIC-targets.patch
rename to package/gcc/6.3.0/894-libgcc-fix-DWARF-compilation-with-FDPIC-targets.patch
diff --git a/package/gcc/6.2.0/895-bfin-define-REENTRANT.patch b/package/gcc/6.3.0/895-bfin-define-REENTRANT.patch
similarity index 100%
rename from package/gcc/6.2.0/895-bfin-define-REENTRANT.patch
rename to package/gcc/6.3.0/895-bfin-define-REENTRANT.patch
diff --git a/package/gcc/6.2.0/940-uclinux-enable-threads.patch b/package/gcc/6.3.0/940-uclinux-enable-threads.patch
similarity index 100%
rename from package/gcc/6.2.0/940-uclinux-enable-threads.patch
rename to package/gcc/6.3.0/940-uclinux-enable-threads.patch
diff --git a/package/gcc/6.2.0/941-mips-Add-support-for-mips-r6-musl.patch b/package/gcc/6.3.0/941-mips-Add-support-for-mips-r6-musl.patch
similarity index 100%
rename from package/gcc/6.2.0/941-mips-Add-support-for-mips-r6-musl.patch
rename to package/gcc/6.3.0/941-mips-Add-support-for-mips-r6-musl.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 64d1a47..d8fbc18 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -97,7 +97,7 @@ config BR2_GCC_VERSION
 	default "4.8.5"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.4"     if BR2_GCC_VERSION_4_9_X
 	default "5.4.0"     if BR2_GCC_VERSION_5_X
-	default "6.2.0"     if BR2_GCC_VERSION_6_X
+	default "6.3.0"     if BR2_GCC_VERSION_6_X
 	default "arc-2016.09-release" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index a4e6085..1988237 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -8,8 +8,8 @@ sha512  47fdfeca0c0a624cdec9c4ae47137d056c918d5c386d4b96985bb3c8172aba377cb66cbc
 sha512  93abb78e16277454f41a8e9810f41f66c0fdffdc539a762ff6b67d3037f78db971378683fd2ebf707d1d51c059fad2161fe42d110c330027f40214b7db0f3efe  gcc-4.9.4.tar.bz2
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.4.0/sha512.sum
 sha512  2941cc950c8f2409a314df497631f9b0266211aa74746c1839c46e04f1c7c299afe2528d1ef16ea39def408a644ba48f97519ec7a7dd37d260c3e9423514265b  gcc-5.4.0.tar.bz2
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-6.2.0/sha512.sum
-sha512  1e8b826a3d44b9d5899309894e20c03abeb352bf3d273b8ad63af814c0ee2911f1a83ce1cd4cdd2d1cb0b3e3c34e9b7ae1b2ab83dfc649ee817ab05247c76198  gcc-6.2.0.tar.bz2
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-6.3.0/sha512.sum
+sha512  234dd9b1bdc9a9c6e352216a7ef4ccadc6c07f156006a59759c5e0e6a69f0abcdc14630eff11e3826dd6ba5933a8faa43043f3d1d62df6bd5ab1e82862f9bf78  gcc-6.3.0.tar.bz2
 
 # Locally calculated (fetched from Github)
 sha512  faae6dc3f7843412068a52de5919797cd23e6ed1b8d140c230d0381f13fd38af67baaa4a09e581c03602127da3dd2fab6f9f5d7ac5d4270585bd079c673dda9a  gcc-arc-2016.09-release.tar.gz
-- 
2.10.2
