From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 22 Jul 2015 11:01:37 -0300
Subject: [Buildroot] [PATCH] binutils: bump 2.25.x series to 2.25.1
Message-ID: <1437573697-12191-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/binutils/{2.25 => 2.25.1}/120-sh-conf.patch                 | 0
 package/binutils/{2.25 => 2.25.1}/300-001_ld_makefile_patch.patch   | 0
 .../binutils/{2.25 => 2.25.1}/300-012_check_ldrunpath_length.patch  | 0
 package/binutils/{2.25 => 2.25.1}/500-sysroot.patch                 | 0
 .../binutils/{2.25 => 2.25.1}/600-poison-system-directories.patch   | 0
 .../905-Fix-trampolines-search-code-for-conditional-branches.patch  | 0
 .../906-xtensa-optimize-check_section_ebb_pcrels_fit.patch          | 0
 .../{2.25 => 2.25.1}/907-xtensa-optimize-removed_by_actions.patch   | 0
 .../{2.25 => 2.25.1}/908-xtensa-optimize-find_removed_literal.patch | 0
 .../909-xtensa-replace-action-list-with-splay-tree.patch            | 0
 .../910-xtensa-optimize-trampolines-relaxation.patch                | 0
 .../911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch  | 0
 .../912-xtensa-fix-gas-segfault-with-text-section-literals.patch    | 0
 package/binutils/Config.in.host                                     | 6 +++---
 package/binutils/binutils.hash                                      | 2 +-
 package/gcc/Config.in.host                                          | 2 +-
 16 files changed, 5 insertions(+), 5 deletions(-)
 rename package/binutils/{2.25 => 2.25.1}/120-sh-conf.patch (100%)
 rename package/binutils/{2.25 => 2.25.1}/300-001_ld_makefile_patch.patch (100%)
 rename package/binutils/{2.25 => 2.25.1}/300-012_check_ldrunpath_length.patch (100%)
 rename package/binutils/{2.25 => 2.25.1}/500-sysroot.patch (100%)
 rename package/binutils/{2.25 => 2.25.1}/600-poison-system-directories.patch (100%)
 rename package/binutils/{2.25 => 2.25.1}/905-Fix-trampolines-search-code-for-conditional-branches.patch (100%)
 rename package/binutils/{2.25 => 2.25.1}/906-xtensa-optimize-check_section_ebb_pcrels_fit.patch (100%)
 rename package/binutils/{2.25 => 2.25.1}/907-xtensa-optimize-removed_by_actions.patch (100%)
 rename package/binutils/{2.25 => 2.25.1}/908-xtensa-optimize-find_removed_literal.patch (100%)
 rename package/binutils/{2.25 => 2.25.1}/909-xtensa-replace-action-list-with-splay-tree.patch (100%)
 rename package/binutils/{2.25 => 2.25.1}/910-xtensa-optimize-trampolines-relaxation.patch (100%)
 rename package/binutils/{2.25 => 2.25.1}/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch (100%)
 rename package/binutils/{2.25 => 2.25.1}/912-xtensa-fix-gas-segfault-with-text-section-literals.patch (100%)

diff --git a/package/binutils/2.25/120-sh-conf.patch b/package/binutils/2.25.1/120-sh-conf.patch
similarity index 100%
rename from package/binutils/2.25/120-sh-conf.patch
rename to package/binutils/2.25.1/120-sh-conf.patch
diff --git a/package/binutils/2.25/300-001_ld_makefile_patch.patch b/package/binutils/2.25.1/300-001_ld_makefile_patch.patch
similarity index 100%
rename from package/binutils/2.25/300-001_ld_makefile_patch.patch
rename to package/binutils/2.25.1/300-001_ld_makefile_patch.patch
diff --git a/package/binutils/2.25/300-012_check_ldrunpath_length.patch b/package/binutils/2.25.1/300-012_check_ldrunpath_length.patch
similarity index 100%
rename from package/binutils/2.25/300-012_check_ldrunpath_length.patch
rename to package/binutils/2.25.1/300-012_check_ldrunpath_length.patch
diff --git a/package/binutils/2.25/500-sysroot.patch b/package/binutils/2.25.1/500-sysroot.patch
similarity index 100%
rename from package/binutils/2.25/500-sysroot.patch
rename to package/binutils/2.25.1/500-sysroot.patch
diff --git a/package/binutils/2.25/600-poison-system-directories.patch b/package/binutils/2.25.1/600-poison-system-directories.patch
similarity index 100%
rename from package/binutils/2.25/600-poison-system-directories.patch
rename to package/binutils/2.25.1/600-poison-system-directories.patch
diff --git a/package/binutils/2.25/905-Fix-trampolines-search-code-for-conditional-branches.patch b/package/binutils/2.25.1/905-Fix-trampolines-search-code-for-conditional-branches.patch
similarity index 100%
rename from package/binutils/2.25/905-Fix-trampolines-search-code-for-conditional-branches.patch
rename to package/binutils/2.25.1/905-Fix-trampolines-search-code-for-conditional-branches.patch
diff --git a/package/binutils/2.25/906-xtensa-optimize-check_section_ebb_pcrels_fit.patch b/package/binutils/2.25.1/906-xtensa-optimize-check_section_ebb_pcrels_fit.patch
similarity index 100%
rename from package/binutils/2.25/906-xtensa-optimize-check_section_ebb_pcrels_fit.patch
rename to package/binutils/2.25.1/906-xtensa-optimize-check_section_ebb_pcrels_fit.patch
diff --git a/package/binutils/2.25/907-xtensa-optimize-removed_by_actions.patch b/package/binutils/2.25.1/907-xtensa-optimize-removed_by_actions.patch
similarity index 100%
rename from package/binutils/2.25/907-xtensa-optimize-removed_by_actions.patch
rename to package/binutils/2.25.1/907-xtensa-optimize-removed_by_actions.patch
diff --git a/package/binutils/2.25/908-xtensa-optimize-find_removed_literal.patch b/package/binutils/2.25.1/908-xtensa-optimize-find_removed_literal.patch
similarity index 100%
rename from package/binutils/2.25/908-xtensa-optimize-find_removed_literal.patch
rename to package/binutils/2.25.1/908-xtensa-optimize-find_removed_literal.patch
diff --git a/package/binutils/2.25/909-xtensa-replace-action-list-with-splay-tree.patch b/package/binutils/2.25.1/909-xtensa-replace-action-list-with-splay-tree.patch
similarity index 100%
rename from package/binutils/2.25/909-xtensa-replace-action-list-with-splay-tree.patch
rename to package/binutils/2.25.1/909-xtensa-replace-action-list-with-splay-tree.patch
diff --git a/package/binutils/2.25/910-xtensa-optimize-trampolines-relaxation.patch b/package/binutils/2.25.1/910-xtensa-optimize-trampolines-relaxation.patch
similarity index 100%
rename from package/binutils/2.25/910-xtensa-optimize-trampolines-relaxation.patch
rename to package/binutils/2.25.1/910-xtensa-optimize-trampolines-relaxation.patch
diff --git a/package/binutils/2.25/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch b/package/binutils/2.25.1/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch
similarity index 100%
rename from package/binutils/2.25/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch
rename to package/binutils/2.25.1/911-xtensa-fix-localized-symbol-refcounting-with-gc-sect.patch
diff --git a/package/binutils/2.25/912-xtensa-fix-gas-segfault-with-text-section-literals.patch b/package/binutils/2.25.1/912-xtensa-fix-gas-segfault-with-text-section-literals.patch
similarity index 100%
rename from package/binutils/2.25/912-xtensa-fix-gas-segfault-with-text-section-literals.patch
rename to package/binutils/2.25.1/912-xtensa-fix-gas-segfault-with-text-section-literals.patch
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 70253cc..6a29722 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -17,8 +17,8 @@ choice
 		depends on !BR2_nios2 && !BR2_powerpc64le
 		bool "binutils 2.24"
 
-	config BR2_BINUTILS_VERSION_2_25
-		bool "binutils 2.25"
+	config BR2_BINUTILS_VERSION_2_25_1
+		bool "binutils 2.25.1"
 
 endchoice
 
@@ -27,7 +27,7 @@ config BR2_BINUTILS_VERSION
 	default "arc-2015.06"	if BR2_arc
 	default "2.23.2"	if BR2_BINUTILS_VERSION_2_23_2
 	default "2.24"		if BR2_BINUTILS_VERSION_2_24
-	default "2.25"		if BR2_BINUTILS_VERSION_2_25
+	default "2.25.1"	if BR2_BINUTILS_VERSION_2_25_1
 
 config BR2_BINUTILS_ENABLE_LTO
 	bool
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 6f45a9c..51499f0 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -2,6 +2,6 @@
 sha512  ffe8ef263ef99183e8cc823fe8487ff7d0f7bf9a8efd2853b5f4636aca0023850d13de4eac7d77a5f69413d8a50e6f95bb14569be53df86c0bce38034525ab74  binutils-2.22.tar.bz2
 sha512  dec753bbba008f1526b89cf1bd85feba78f362f5333ffdf93953fd131eb755976dec82a0a4ba38c43d2434da007137780cfe674de5414be5cf7ce7fbc6af6d16  binutils-2.23.2.tar.bz2
 sha512  5ec95ad47d49b12c4558a8db0ca2109d3ee1955e3776057f3330c4506f8f4d1cf5e505fbf8a16b98403a0fcdeaaf986fe0a22be6456247dbdace63ce1f776b12  binutils-2.24.tar.bz2
-sha512  49438970642f379978aba988e3d2e7b63dab6fd0b46d91f4100f083e87a84d242089daca58572245fe620457a77bbbe2d78588ff3fb79314e500d1a39bf96f30  binutils-2.25.tar.bz2
+sha512  0b36dda0e6d32cd25613c0e64b56b28312515c54d6a159efd3db9a86717f114ab0a0a1f69d08975084d55713ebaeab64e4085c9b3d1c3fa86712869f80eb954d  binutils-2.25.1.tar.bz2
 # No hash for the ARC variant, comes from the github-helper:
 none   xxx  binutils-arc-2015.06.tar.gz
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 3d64b6f..94b6f29 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -61,7 +61,7 @@ choice
 		# Broken or unsupported PPC cores
 		depends on !BR2_powerpc_power8
 		# gcc-4.8.x + binutils-2.25 is broken for MIPS
-		depends on !((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && BR2_BINUTILS_VERSION_2_25)
+		depends on !((BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el) && BR2_BINUTILS_VERSION_2_25_1)
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
 
-- 
2.3.6
