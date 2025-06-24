Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371FBC7EE31
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10330402D5;
	Thu, 26 Jun 2025 19:49:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X_eBkkMj8fpz; Thu, 26 Jun 2025 19:49:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FB18402FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FB18402FA;
	Thu, 26 Jun 2025 19:49:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5319C154
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96B2D843D5
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4CWn7RUtOH_w for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:49:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AE6A843D3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AE6A843D3
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 48FB584057; Thu, 26 Jun 2025 19:49:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 24 Jun 2025 20:41:14 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 4fe2c33f199e15f577de460a0db560cba5d01788
X-Git-Newrev: c54ca15c65828d8ae1a39fce60777a5380efd84b
X-Patchwork-Hint: ignore
Message-Id: <20250626194922.48FB584057@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/libplatform: bump
 version
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c54ca15c65828d8ae1a39fce60777a5380efd84b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Removed patch which is included in this release:
https://github.com/Pulse-Eight/platform/commit/e48db06c64613ac76c820511da95228bcd072f64

Use upstream-provided license file:
https://github.com/Pulse-Eight/platform/commit/92220248b11c43a80105567dbb074c5f30b04029

This bump includes compatibility with cmake 4.x:
https://github.com/Pulse-Eight/platform/commit/d7faed1c696b1a6a67f114a63a0f4c085f0f9195

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: remove patch entry in .checkpackageignore]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 4da169b03eeb15ab3f7ed7f41c916290d5a3c928)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                |  1 -
 ...make-require-c-11-as-the-minimum-standard.patch | 26 ----------------------
 package/libplatform/libplatform.hash               |  4 ++--
 package/libplatform/libplatform.mk                 |  4 ++--
 4 files changed, 4 insertions(+), 31 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a0cbbdb7c4..7c27c86068 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -680,7 +680,6 @@ package/liboping/0003-Fix-compile-break-with-GCC-7-buffer-overflow-with-snprintf
 package/liboping/0004-Fix-compile-error-on-GCC-7.patch lib_patch.Upstream
 package/liboping/0005-src-oping.c-always-use-s-style-format-for-printf-sty.patch lib_patch.Upstream
 package/libp11/0001-src-p11_attr.c-fix-build-with-gcc-4.8.patch lib_patch.Upstream
-package/libplatform/0001-cmake-require-c-11-as-the-minimum-standard.patch lib_patch.Upstream
 package/libpthsem/0001-fix-build-on-linux-3.x-host.patch lib_patch.Upstream
 package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch lib_patch.Upstream
 package/libroxml/0001-src-roxml_mem.h-add-missing-extern.patch lib_patch.Upstream
diff --git a/package/libplatform/0001-cmake-require-c-11-as-the-minimum-standard.patch b/package/libplatform/0001-cmake-require-c-11-as-the-minimum-standard.patch
deleted file mode 100644
index b880a31953..0000000000
--- a/package/libplatform/0001-cmake-require-c-11-as-the-minimum-standard.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From ad9fcceb6267e737316b616551b7aac3cf676481 Mon Sep 17 00:00:00 2001
-From: Lukas Rusak <lorusak@gmail.com>
-Date: Fri, 2 Oct 2020 15:31:36 -0700
-Subject: [PATCH] [cmake] require c++11 as the minimum standard
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/Pulse-Eight/platform/pull/46]
----
- CMakeLists.txt | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7144b0b..e9112f9 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -3,6 +3,10 @@ project(p8-platform)
- cmake_minimum_required(VERSION 2.8.9)
- enable_language(CXX)
- 
-+set(CMAKE_CXX_STANDARD 11)
-+set(CMAKE_CXX_STANDARD_REQUIRED YES)
-+set(CMAKE_CXX_EXTENSIONS NO)
-+
- set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR})
- 
- find_package(Threads REQUIRED)
diff --git a/package/libplatform/libplatform.hash b/package/libplatform/libplatform.hash
index 283b435b7c..5fead5eb95 100644
--- a/package/libplatform/libplatform.hash
+++ b/package/libplatform/libplatform.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ebee46c76b86b40b703fa913465f5004fa3166eeb6a4794c58fc8a5c25702931  libplatform-a7cd0d5780ed80a4e70480d1650749f29e8a1fb2.tar.gz
-sha256  80fc66febbb2393c9d518e3eefa4ad9aae15a9b6a84174c0e443ea79eeea5131  src/os.h
+sha256  2ab98ba486b28dd9c31e9f0f8a04eddad12c09ad1951c359fdef475baafba296  libplatform-2748be52ae27e6007ef548b697d4a03ff7de4291.tar.gz
+sha256  0137261d24ce001fc5237aacddd267533e0f150ac23cf21acffea599f7358f7a  LICENSE.md
diff --git a/package/libplatform/libplatform.mk b/package/libplatform/libplatform.mk
index 90192369fe..aeded5e9a7 100644
--- a/package/libplatform/libplatform.mk
+++ b/package/libplatform/libplatform.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBPLATFORM_VERSION = a7cd0d5780ed80a4e70480d1650749f29e8a1fb2
+LIBPLATFORM_VERSION = 2748be52ae27e6007ef548b697d4a03ff7de4291
 LIBPLATFORM_SITE = $(call github,Pulse-Eight,platform,$(LIBPLATFORM_VERSION))
 LIBPLATFORM_LICENSE = GPL-2.0+
-LIBPLATFORM_LICENSE_FILES = src/os.h
+LIBPLATFORM_LICENSE_FILES = LICENSE.md
 LIBPLATFORM_INSTALL_STAGING = YES
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
