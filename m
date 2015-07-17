From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 17 Jul 2015 11:31:13 -0300
Subject: [Buildroot] [PATCH 1/2] gcc: bump 5.x series to version 5.2.0
Message-ID: <1437143474-9187-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also rename the BR2_GCC_VERSION_5_1_X symbol to BR2_GCC_VERSION_5_X to
reflect this change to match the new versioning scheme.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/{5.1.0 => 5.2.0}/100-uclibc-conf.patch                  | 0
 .../gcc/{5.1.0 => 5.2.0}/200-gcc-poison-system-directories.patch    | 0
 package/gcc/{5.1.0 => 5.2.0}/201-libgcc-remove-unistd-header.patch  | 0
 package/gcc/{5.1.0 => 5.2.0}/301-missing-execinfo_h.patch           | 0
 package/gcc/{5.1.0 => 5.2.0}/810-arm-softfloat-libgcc.patch         | 0
 package/gcc/{5.1.0 => 5.2.0}/830-arm_unbreak_armv4t.patch           | 0
 .../{5.1.0 => 5.2.0}/840-microblaze-enable-dwarf-eh-support.patch   | 0
 package/gcc/{5.1.0 => 5.2.0}/850-libstdcxx-uclibc-c99.patch         | 0
 package/gcc/{5.1.0 => 5.2.0}/860-cilk-wchar.patch                   | 0
 .../gcc/{5.1.0 => 5.2.0}/900-libitm-fixes-for-musl-support.patch    | 0
 .../{5.1.0 => 5.2.0}/901-fixincludes-update-for-musl-support.patch  | 0
 package/gcc/{5.1.0 => 5.2.0}/902-unwind-fix-for-musl.patch          | 0
 .../903-libstdc++-libgfortran-gthr-workaround-for-musl.patch        | 0
 package/gcc/{5.1.0 => 5.2.0}/904-musl-libc-config.patch             | 0
 package/gcc/{5.1.0 => 5.2.0}/905-add-musl-support-to-gcc.patch      | 0
 package/gcc/{5.1.0 => 5.2.0}/906-mips-musl-support.patch            | 0
 package/gcc/{5.1.0 => 5.2.0}/907-x86-musl-support.patch             | 0
 package/gcc/{5.1.0 => 5.2.0}/908-arm-musl-support.patch             | 0
 package/gcc/{5.1.0 => 5.2.0}/909-aarch64-musl-support.patch         | 0
 package/gcc/Config.in.host                                          | 6 +++---
 package/gcc/gcc.hash                                                | 4 ++--
 21 files changed, 5 insertions(+), 5 deletions(-)
 rename package/gcc/{5.1.0 => 5.2.0}/100-uclibc-conf.patch (100%)
 rename package/gcc/{5.1.0 => 5.2.0}/200-gcc-poison-system-directories.patch (100%)
 rename package/gcc/{5.1.0 => 5.2.0}/201-libgcc-remove-unistd-header.patch (100%)
 rename package/gcc/{5.1.0 => 5.2.0}/301-missing-execinfo_h.patch (100%)
 rename package/gcc/{5.1.0 => 5.2.0}/810-arm-softfloat-libgcc.patch (100%)
 rename package/gcc/{5.1.0 => 5.2.0}/830-arm_unbreak_armv4t.patch (100%)
 rename package/gcc/{5.1.0 => 5.2.0}/840-microblaze-enable-dwarf-eh-support.patch (100%)
 rename package/gcc/{5.1.0 => 5.2.0}/850-libstdcxx-uclibc-c99.patch (100%)
 rename package/gcc/{5.1.0 => 5.2.0}/860-cilk-wchar.patch (100%)
 rename package/gcc/{5.1.0 => 5.2.0}/900-libitm-fixes-for-musl-support.patch (100%)
 rename package/gcc/{5.1.0 => 5.2.0}/901-fixincludes-update-for-musl-support.patch (100%)
 rename package/gcc/{5.1.0 => 5.2.0}/902-unwind-fix-for-musl.patch (100%)
 rename package/gcc/{5.1.0 => 5.2.0}/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch (100%)
 rename package/gcc/{5.1.0 => 5.2.0}/904-musl-libc-config.patch (100%)
 rename package/gcc/{5.1.0 => 5.2.0}/905-add-musl-support-to-gcc.patch (100%)
 rename package/gcc/{5.1.0 => 5.2.0}/906-mips-musl-support.patch (100%)
 rename package/gcc/{5.1.0 => 5.2.0}/907-x86-musl-support.patch (100%)
 rename package/gcc/{5.1.0 => 5.2.0}/908-arm-musl-support.patch (100%)
 rename package/gcc/{5.1.0 => 5.2.0}/909-aarch64-musl-support.patch (100%)

diff --git a/package/gcc/5.1.0/100-uclibc-conf.patch b/package/gcc/5.2.0/100-uclibc-conf.patch
similarity index 100%
rename from package/gcc/5.1.0/100-uclibc-conf.patch
rename to package/gcc/5.2.0/100-uclibc-conf.patch
diff --git a/package/gcc/5.1.0/200-gcc-poison-system-directories.patch b/package/gcc/5.2.0/200-gcc-poison-system-directories.patch
similarity index 100%
rename from package/gcc/5.1.0/200-gcc-poison-system-directories.patch
rename to package/gcc/5.2.0/200-gcc-poison-system-directories.patch
diff --git a/package/gcc/5.1.0/201-libgcc-remove-unistd-header.patch b/package/gcc/5.2.0/201-libgcc-remove-unistd-header.patch
similarity index 100%
rename from package/gcc/5.1.0/201-libgcc-remove-unistd-header.patch
rename to package/gcc/5.2.0/201-libgcc-remove-unistd-header.patch
diff --git a/package/gcc/5.1.0/301-missing-execinfo_h.patch b/package/gcc/5.2.0/301-missing-execinfo_h.patch
similarity index 100%
rename from package/gcc/5.1.0/301-missing-execinfo_h.patch
rename to package/gcc/5.2.0/301-missing-execinfo_h.patch
diff --git a/package/gcc/5.1.0/810-arm-softfloat-libgcc.patch b/package/gcc/5.2.0/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from package/gcc/5.1.0/810-arm-softfloat-libgcc.patch
rename to package/gcc/5.2.0/810-arm-softfloat-libgcc.patch
diff --git a/package/gcc/5.1.0/830-arm_unbreak_armv4t.patch b/package/gcc/5.2.0/830-arm_unbreak_armv4t.patch
similarity index 100%
rename from package/gcc/5.1.0/830-arm_unbreak_armv4t.patch
rename to package/gcc/5.2.0/830-arm_unbreak_armv4t.patch
diff --git a/package/gcc/5.1.0/840-microblaze-enable-dwarf-eh-support.patch b/package/gcc/5.2.0/840-microblaze-enable-dwarf-eh-support.patch
similarity index 100%
rename from package/gcc/5.1.0/840-microblaze-enable-dwarf-eh-support.patch
rename to package/gcc/5.2.0/840-microblaze-enable-dwarf-eh-support.patch
diff --git a/package/gcc/5.1.0/850-libstdcxx-uclibc-c99.patch b/package/gcc/5.2.0/850-libstdcxx-uclibc-c99.patch
similarity index 100%
rename from package/gcc/5.1.0/850-libstdcxx-uclibc-c99.patch
rename to package/gcc/5.2.0/850-libstdcxx-uclibc-c99.patch
diff --git a/package/gcc/5.1.0/860-cilk-wchar.patch b/package/gcc/5.2.0/860-cilk-wchar.patch
similarity index 100%
rename from package/gcc/5.1.0/860-cilk-wchar.patch
rename to package/gcc/5.2.0/860-cilk-wchar.patch
diff --git a/package/gcc/5.1.0/900-libitm-fixes-for-musl-support.patch b/package/gcc/5.2.0/900-libitm-fixes-for-musl-support.patch
similarity index 100%
rename from package/gcc/5.1.0/900-libitm-fixes-for-musl-support.patch
rename to package/gcc/5.2.0/900-libitm-fixes-for-musl-support.patch
diff --git a/package/gcc/5.1.0/901-fixincludes-update-for-musl-support.patch b/package/gcc/5.2.0/901-fixincludes-update-for-musl-support.patch
similarity index 100%
rename from package/gcc/5.1.0/901-fixincludes-update-for-musl-support.patch
rename to package/gcc/5.2.0/901-fixincludes-update-for-musl-support.patch
diff --git a/package/gcc/5.1.0/902-unwind-fix-for-musl.patch b/package/gcc/5.2.0/902-unwind-fix-for-musl.patch
similarity index 100%
rename from package/gcc/5.1.0/902-unwind-fix-for-musl.patch
rename to package/gcc/5.2.0/902-unwind-fix-for-musl.patch
diff --git a/package/gcc/5.1.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch b/package/gcc/5.2.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch
similarity index 100%
rename from package/gcc/5.1.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch
rename to package/gcc/5.2.0/903-libstdc++-libgfortran-gthr-workaround-for-musl.patch
diff --git a/package/gcc/5.1.0/904-musl-libc-config.patch b/package/gcc/5.2.0/904-musl-libc-config.patch
similarity index 100%
rename from package/gcc/5.1.0/904-musl-libc-config.patch
rename to package/gcc/5.2.0/904-musl-libc-config.patch
diff --git a/package/gcc/5.1.0/905-add-musl-support-to-gcc.patch b/package/gcc/5.2.0/905-add-musl-support-to-gcc.patch
similarity index 100%
rename from package/gcc/5.1.0/905-add-musl-support-to-gcc.patch
rename to package/gcc/5.2.0/905-add-musl-support-to-gcc.patch
diff --git a/package/gcc/5.1.0/906-mips-musl-support.patch b/package/gcc/5.2.0/906-mips-musl-support.patch
similarity index 100%
rename from package/gcc/5.1.0/906-mips-musl-support.patch
rename to package/gcc/5.2.0/906-mips-musl-support.patch
diff --git a/package/gcc/5.1.0/907-x86-musl-support.patch b/package/gcc/5.2.0/907-x86-musl-support.patch
similarity index 100%
rename from package/gcc/5.1.0/907-x86-musl-support.patch
rename to package/gcc/5.2.0/907-x86-musl-support.patch
diff --git a/package/gcc/5.1.0/908-arm-musl-support.patch b/package/gcc/5.2.0/908-arm-musl-support.patch
similarity index 100%
rename from package/gcc/5.1.0/908-arm-musl-support.patch
rename to package/gcc/5.2.0/908-arm-musl-support.patch
diff --git a/package/gcc/5.1.0/909-aarch64-musl-support.patch b/package/gcc/5.2.0/909-aarch64-musl-support.patch
similarity index 100%
rename from package/gcc/5.1.0/909-aarch64-musl-support.patch
rename to package/gcc/5.2.0/909-aarch64-musl-support.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 4501b32..6a4086e 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -79,8 +79,8 @@ choice
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
 
-	config BR2_GCC_VERSION_5_1_X
-		bool "gcc 5.1.x"
+	config BR2_GCC_VERSION_5_X
+		bool "gcc 5.x"
 		# Broken or unsupported architectures
 		depends on !BR2_arc
 		select BR2_GCC_NEEDS_MPC
@@ -98,7 +98,7 @@ config BR2_GCC_VERSION
 	default "4.7.4"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.5"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.3"     if BR2_GCC_VERSION_4_9_X
-	default "5.1.0"     if BR2_GCC_VERSION_5_1_X
+	default "5.2.0"     if BR2_GCC_VERSION_5_X
 	default "arc-2015.06-rc1" if BR2_GCC_VERSION_4_8_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 1506ad9..9f1874c 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -6,7 +6,7 @@ sha512  dfcb737073191e628231031a3571ec77ee760a59377630f4a6e4fdfa66f9ddad39fde47e
 sha512  47fdfeca0c0a624cdec9c4ae47137d056c918d5c386d4b96985bb3c8172aba377cb66cbcc30e80832fd244a7d98f562c20198056915c70cfef0977545073a8ea  gcc-4.8.5.tar.bz2
 # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.9.3/sha512.sum
 sha512  9ac57377a6975fc7adac704ec81355262b9f537def6955576753b87715470a20ee6a2a3144a79cc8fcba3443f7b44c7337d79d704b522d053f54f79aa6b442df  gcc-4.9.3.tar.bz2
-# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.1.0/sha512.sum
-sha512  30f6a94d3adb25bc51fcaddf32a6c41429f569eeb9ed64330445b1296f99998fbfa03277b375be4f7b2b80f519910ef88e4149db7cd9031e2c61a49f501bde94  gcc-5.1.0.tar.bz2
+# From ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.2.0/sha512.sum
+sha512  844120349ec04465dcea52d8ec747f1cbbc9d76a39fe3d8ef5e6b93614e63d718862d60d0a1c1cbf59ffc7815562287d0a2e536a6b220cebcd0b8de4ba35e715   gcc-5.2.0.tar.bz2
 # No hash for the ARC variant, comes from the github-helper:
 none  xxx  gcc-arc-2015.06-rc1.tar.gz
-- 
2.3.6
