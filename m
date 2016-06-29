From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 29 Jun 2016 19:35:54 -0300
Subject: [Buildroot] [PATCH] binutils: bump 2.26.x series to 2.26.1
Message-ID: <1467239754-28077-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/binutils/{2.26 => 2.26.1}/0120-sh-conf.patch                  | 0
 package/binutils/{2.26 => 2.26.1}/0300-ld-makefile.patch              | 0
 package/binutils/{2.26 => 2.26.1}/0301-check-ldrunpath-length.patch   | 0
 .../{2.26 => 2.26.1}/0500-add-sysroot-fix-from-bug-3049.patch         | 0
 .../binutils/{2.26 => 2.26.1}/0600-poison-system-directories.patch    | 0
 .../{2.26 => 2.26.1}/0900-Correct-nios2-_gp-address-computation.patch | 0
 .../0901-Fix-assertion-reduce-number-of-messages-about-FDE-en.patch   | 0
 .../0902-xtensa-fix-signedness-of-gas-relocations.patch               | 0
 .../0903-xtensa-fix-.init-.fini-literals-moving.patch                 | 0
 package/binutils/Config.in.host                                       | 4 ++--
 package/binutils/binutils.hash                                        | 2 +-
 11 files changed, 3 insertions(+), 3 deletions(-)
 rename package/binutils/{2.26 => 2.26.1}/0120-sh-conf.patch (100%)
 rename package/binutils/{2.26 => 2.26.1}/0300-ld-makefile.patch (100%)
 rename package/binutils/{2.26 => 2.26.1}/0301-check-ldrunpath-length.patch (100%)
 rename package/binutils/{2.26 => 2.26.1}/0500-add-sysroot-fix-from-bug-3049.patch (100%)
 rename package/binutils/{2.26 => 2.26.1}/0600-poison-system-directories.patch (100%)
 rename package/binutils/{2.26 => 2.26.1}/0900-Correct-nios2-_gp-address-computation.patch (100%)
 rename package/binutils/{2.26 => 2.26.1}/0901-Fix-assertion-reduce-number-of-messages-about-FDE-en.patch (100%)
 rename package/binutils/{2.26 => 2.26.1}/0902-xtensa-fix-signedness-of-gas-relocations.patch (100%)
 rename package/binutils/{2.26 => 2.26.1}/0903-xtensa-fix-.init-.fini-literals-moving.patch (100%)

diff --git a/package/binutils/2.26/0120-sh-conf.patch b/package/binutils/2.26.1/0120-sh-conf.patch
similarity index 100%
rename from package/binutils/2.26/0120-sh-conf.patch
rename to package/binutils/2.26.1/0120-sh-conf.patch
diff --git a/package/binutils/2.26/0300-ld-makefile.patch b/package/binutils/2.26.1/0300-ld-makefile.patch
similarity index 100%
rename from package/binutils/2.26/0300-ld-makefile.patch
rename to package/binutils/2.26.1/0300-ld-makefile.patch
diff --git a/package/binutils/2.26/0301-check-ldrunpath-length.patch b/package/binutils/2.26.1/0301-check-ldrunpath-length.patch
similarity index 100%
rename from package/binutils/2.26/0301-check-ldrunpath-length.patch
rename to package/binutils/2.26.1/0301-check-ldrunpath-length.patch
diff --git a/package/binutils/2.26/0500-add-sysroot-fix-from-bug-3049.patch b/package/binutils/2.26.1/0500-add-sysroot-fix-from-bug-3049.patch
similarity index 100%
rename from package/binutils/2.26/0500-add-sysroot-fix-from-bug-3049.patch
rename to package/binutils/2.26.1/0500-add-sysroot-fix-from-bug-3049.patch
diff --git a/package/binutils/2.26/0600-poison-system-directories.patch b/package/binutils/2.26.1/0600-poison-system-directories.patch
similarity index 100%
rename from package/binutils/2.26/0600-poison-system-directories.patch
rename to package/binutils/2.26.1/0600-poison-system-directories.patch
diff --git a/package/binutils/2.26/0900-Correct-nios2-_gp-address-computation.patch b/package/binutils/2.26.1/0900-Correct-nios2-_gp-address-computation.patch
similarity index 100%
rename from package/binutils/2.26/0900-Correct-nios2-_gp-address-computation.patch
rename to package/binutils/2.26.1/0900-Correct-nios2-_gp-address-computation.patch
diff --git a/package/binutils/2.26/0901-Fix-assertion-reduce-number-of-messages-about-FDE-en.patch b/package/binutils/2.26.1/0901-Fix-assertion-reduce-number-of-messages-about-FDE-en.patch
similarity index 100%
rename from package/binutils/2.26/0901-Fix-assertion-reduce-number-of-messages-about-FDE-en.patch
rename to package/binutils/2.26.1/0901-Fix-assertion-reduce-number-of-messages-about-FDE-en.patch
diff --git a/package/binutils/2.26/0902-xtensa-fix-signedness-of-gas-relocations.patch b/package/binutils/2.26.1/0902-xtensa-fix-signedness-of-gas-relocations.patch
similarity index 100%
rename from package/binutils/2.26/0902-xtensa-fix-signedness-of-gas-relocations.patch
rename to package/binutils/2.26.1/0902-xtensa-fix-signedness-of-gas-relocations.patch
diff --git a/package/binutils/2.26/0903-xtensa-fix-.init-.fini-literals-moving.patch b/package/binutils/2.26.1/0903-xtensa-fix-.init-.fini-literals-moving.patch
similarity index 100%
rename from package/binutils/2.26/0903-xtensa-fix-.init-.fini-literals-moving.patch
rename to package/binutils/2.26.1/0903-xtensa-fix-.init-.fini-literals-moving.patch
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 0d90e3e..583aaad 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -20,7 +20,7 @@ choice
 		bool "binutils 2.25.1"
 
 	config BR2_BINUTILS_VERSION_2_26_X
-		bool "binutils 2.26"
+		bool "binutils 2.26.1"
 
 endchoice
 
@@ -29,7 +29,7 @@ config BR2_BINUTILS_VERSION
 	default "arc-2016.09-eng005"	if BR2_arc
 	default "2.24"		if BR2_BINUTILS_VERSION_2_24_X
 	default "2.25.1"	if BR2_BINUTILS_VERSION_2_25_X
-	default "2.26"		if BR2_BINUTILS_VERSION_2_26_X
+	default "2.26.1"	if BR2_BINUTILS_VERSION_2_26_X
 
 config BR2_BINUTILS_ENABLE_LTO
 	bool
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index b313702..412dc11 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -1,7 +1,7 @@
 # From ftp://gcc.gnu.org/pub/binutils/releases/sha512.sum
 sha512  5ec95ad47d49b12c4558a8db0ca2109d3ee1955e3776057f3330c4506f8f4d1cf5e505fbf8a16b98403a0fcdeaaf986fe0a22be6456247dbdace63ce1f776b12  binutils-2.24.tar.bz2
 sha512  0b36dda0e6d32cd25613c0e64b56b28312515c54d6a159efd3db9a86717f114ab0a0a1f69d08975084d55713ebaeab64e4085c9b3d1c3fa86712869f80eb954d  binutils-2.25.1.tar.bz2
-sha512  e77e1b8dbbcbaf9ac2fae95c4403615808af3be03b2e1d32448cd3a7d32c43273f8bcace3f2de84ec120a982879295673029da306e2885dbf5f990584932cfc7  binutils-2.26.tar.bz2
+sha512  9d9165609fd3b0f20d616f9891fc8e2b466eb13e2bfce40125e12427f8f201d20e2b8322bb6cb2b45e8df812f0e8ac059149f8a1f69ba3ed9d86a35c6a540b67  binutils-2.26.1.tar.bz2
 
 # Locally calculated (fetched from Github)
 sha512  a0e2974990d6087aef94fec958b9f14458e847308d59dfb6f5dd8e9d1a246c4c4885a240ba43f15a7a20aff43bccba5a664daadf7fae54415bb8298620b46c23  binutils-arc-2016.09-eng005.tar.gz
-- 
2.7.3
