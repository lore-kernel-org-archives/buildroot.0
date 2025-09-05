Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240EBCA1010
	for <buildroot@archiver.kernel.org>; Fri,  5 Sep 2025 17:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52308610EE;
	Fri,  5 Sep 2025 17:33:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7GElQHoGq2GS; Fri,  5 Sep 2025 17:33:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 022FC60D8E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 022FC60D8E;
	Fri,  5 Sep 2025 17:33:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 71ABDCA
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 17:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57D4482299
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 17:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MHJsas6jYLa8 for <buildroot@buildroot.org>;
 Fri,  5 Sep 2025 17:32:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 609FC822B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 609FC822B1
 for <buildroot@buildroot.org>; Fri,  5 Sep 2025 17:32:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A651835D0; Fri,  5 Sep 2025 17:32:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Sep 2025 18:36:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc50e439b306687e3fcee1f9d012e4d9989d3985
X-Git-Newrev: 5e99e8a38282dbd810450c4be0156ea77e4c6e04
X-Patchwork-Hint: ignore
Message-Id: <20250905173259.5A651835D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/exiv2: security bump version to
 0.28.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5e99e8a38282dbd810450c4be0156ea77e4c6e04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://exiv2.org/whatsnew.html
https://github.com/Exiv2/exiv2/blob/v0.28.7/doc/ChangeLog

Release notes of 0.28.0 with a long list of security-related fixes:
https://github.com/Exiv2/exiv2/issues/2406#issuecomment-1529139799

0.28.1 fixed CVE-2023-44398: https://github.com/Exiv2/exiv2/issues/2813

0.28.2 fixed CVE-2024-24826 & CVE-2024-25112:
https://github.com/Exiv2/exiv2/issues/2914

0.28.3 fixed CVE-2024-39695: https://github.com/Exiv2/exiv2/issues/3008

0.28.5 fixed CVE-2025-26623: https://github.com/Exiv2/exiv2/issues/3181

0.28.6 fixed
* [CVE-2025-54080](https://github.com/Exiv2/exiv2/security/advisories/GHSA-496f-x7cq-cq39)
* [CVE-2025-55304](https://github.com/Exiv2/exiv2/security/advisories/GHSA-m54q-mm9w-fp6g)

Please read https://github.com/Exiv2/exiv2/issues/2406 for the discussion
whether these CVEs are relevant and their status of backporting to the
0.27.x branch.

Removed patch which is included in this release.
Switch to github helper due to upstream not providing tarballs anymore.

Added optional support for inih:
https://github.com/Exiv2/exiv2/commit/43c9ec0f5095d92e2dd748c6c0b6f7ae4e6c73bf
and brotli:
https://github.com/Exiv2/exiv2/commit/557a5cebd52ced79d11080089d8e2874126fb038
both introduced in the 0.28.x branch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...001-add-BUILD_WITH_STACK_PROTECTOR-option.patch | 54 ----------------------
 package/exiv2/Config.in                            | 12 +++++
 package/exiv2/exiv2.hash                           |  2 +-
 package/exiv2/exiv2.mk                             | 19 ++++++--
 4 files changed, 29 insertions(+), 58 deletions(-)

diff --git a/package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch b/package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch
deleted file mode 100644
index 18684ebbfa..0000000000
--- a/package/exiv2/0001-add-BUILD_WITH_STACK_PROTECTOR-option.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 4bb57da5fb0bb0d7e747b9e325e9ec0876ffc1f9 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 31 Jul 2021 16:36:50 +0200
-Subject: [PATCH] add BUILD_WITH_STACK_PROTECTOR option
-
-Add BUILD_WITH_STACK_PROTECTOR to avoid the following build failure with
-toolchains that don't support stack-protector:
-
-/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/9.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: utils.cpp:(.text._ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_St20forward_iterator_tag[_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE12_M_constructIPcEEvT_S7_St20forward_iterator_tag]+0xd0): undefined reference to `__stack_chk_fail'
-
-Indeed, support for -fstack-protector-strong can't be detected through
-check_cxx_compiler_flag as some toolchains need to link with -lssp to
-enable SSP support
-
-Fixes:
- - http://autobuild.buildroot.org/results/ae4635899124c602c70d2b342a76f95c34aa4a3d
-
-Upstream: https://github.com/Exiv2/exiv2/commit/f31c0eba098889899d29b7b0da830aee2b62a7b8
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- CMakeLists.txt            | 1 +
- cmake/compilerFlags.cmake | 4 ++--
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6f0da06a..0746ee14 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -47,6 +47,7 @@ mark_as_advanced(
-     EXIV2_TEAM_USE_SANITIZERS
- )
- 
-+option( BUILD_WITH_STACK_PROTECTOR    "Build with stack protector"                            ON )
- option( BUILD_WITH_CCACHE             "Use ccache to speed up compilations"                   OFF )
- option( BUILD_WITH_COVERAGE           "Add compiler flags to generate coverage stats"         OFF )
- 
-diff --git a/cmake/compilerFlags.cmake b/cmake/compilerFlags.cmake
-index 35faf501..0a646e50 100644
---- a/cmake/compilerFlags.cmake
-+++ b/cmake/compilerFlags.cmake
-@@ -33,8 +33,8 @@ if ( MINGW OR UNIX OR MSYS ) # MINGW, Linux, APPLE, CYGWIN
-             endif()
-             if(HAS_FCF_PROTECTION)
-                 add_compile_options(-fcf-protection)
--            endif()
--            if(HAS_FSTACK_PROTECTOR_STRONG)
-+              endif()
-+	    if(BUILD_WITH_STACK_PROTECTOR AND HAS_FSTACK_PROTECTOR_STRONG)
-                 add_compile_options(-fstack-protector-strong)
-             endif()
-         endif()
--- 
-2.31.1
-
diff --git a/package/exiv2/Config.in b/package/exiv2/Config.in
index 8407c25b41..c65e484b2e 100644
--- a/package/exiv2/Config.in
+++ b/package/exiv2/Config.in
@@ -20,6 +20,18 @@ config BR2_PACKAGE_EXIV2
 
 if BR2_PACKAGE_EXIV2
 
+config BR2_PACKAGE_EXIV2_BROTLI
+	bool "Brotli support"
+	select BR2_PACKAGE_BROTLI
+	help
+	  Build with Brotli support for JPEG XL
+
+config BR2_PACKAGE_EXIV2_INIH
+	bool "Inih support"
+	select BR2_PACKAGE_INIH
+	help
+	  Build with inih support
+
 config BR2_PACKAGE_EXIV2_PNG
 	bool "PNG image support"
 	select BR2_PACKAGE_ZLIB
diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
index c871277801..1c85f2e1db 100644
--- a/package/exiv2/exiv2.hash
+++ b/package/exiv2/exiv2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4c192483a1125dc59a3d70b30d30d32edace9e14adf52802d2f853abf72db8a6  exiv2-0.27.6-Source.tar.gz
+sha256  5e292b02614dbc0cee40fe1116db2f42f63ef6b2ba430c77b614e17b8d61a638  exiv2-0.28.7.tar.gz
 sha256  a7ba75cb966aca374711e2af49e5f3aea6a4443a803440f5d93e73a5a1222f66  COPYING
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index 869f8e48dd..e5b55ecde7 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-EXIV2_VERSION = 0.27.6
-EXIV2_SOURCE = exiv2-$(EXIV2_VERSION)-Source.tar.gz
-EXIV2_SITE = https://github.com/Exiv2/exiv2/releases/download/v$(EXIV2_VERSION)
+EXIV2_VERSION = 0.28.7
+EXIV2_SITE = $(call github,Exiv2,exiv2,v$(EXIV2_VERSION))
 EXIV2_INSTALL_STAGING = YES
 EXIV2_LICENSE = GPL-2.0+
 EXIV2_LICENSE_FILES = COPYING
@@ -16,6 +15,20 @@ EXIV2_CONF_OPTS += \
 	-DBUILD_WITH_STACK_PROTECTOR=OFF \
 	-DEXIV2_BUILD_SAMPLES=OFF
 
+ifeq ($(BR2_PACKAGE_EXIV2_BROTLI),y)
+EXIV2_CONF_OPTS += -DEXIV2_ENABLE_BROTLI=ON
+EXIV2_DEPENDENCIES += brotli
+else
+EXIV2_CONF_OPTS += -DEXIV2_ENABLE_BROTLI=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_EXIV2_INIH),y)
+EXIV2_CONF_OPTS += -DEXIV2_ENABLE_INIH=ON
+EXIV2_DEPENDENCIES += inih
+else
+EXIV2_CONF_OPTS += -DEXIV2_ENABLE_INIH=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_EXIV2_LENSDATA),y)
 EXIV2_CONF_OPTS += -DEXIV2_ENABLE_LENSDATA=ON
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
