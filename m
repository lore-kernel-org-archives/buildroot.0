Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABBBCF6488
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 22:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB9F0611A5;
	Wed, 19 Nov 2025 22:39:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LP7XYxWBcj4Z; Wed, 19 Nov 2025 22:39:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB7FA611F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB7FA611F0;
	Wed, 19 Nov 2025 22:39:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BA54158
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 22:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 581FB410A3
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 22:39:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bBlj7TIUDVnP for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 22:38:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 414A44116E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 414A44116E
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 22:38:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3213B8572E; Wed, 19 Nov 2025 22:38:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 19 Nov 2025 21:43:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 658e2287bfc56e547fd57671fab621ecabbd4eb8
X-Git-Newrev: 56a1c162c552be76d8224cb3d96a52214d2ea341
X-Patchwork-Hint: ignore
Message-Id: <20251119223859.3213B8572E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project: bump to version
 21.1.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=56a1c162c552be76d8224cb3d96a52214d2ea341
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://discourse.llvm.org/t/llvm-21-1-6-released/88895

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/llvm-project/clang/clang.hash                   | 2 +-
 package/llvm-project/compiler-rt/compiler-rt.hash       | 4 ++--
 package/llvm-project/libclc/libclc.hash                 | 2 +-
 package/llvm-project/lld/lld.hash                       | 2 +-
 package/llvm-project/llvm-cmake/llvm-cmake.hash         | 2 +-
 package/llvm-project/llvm-libunwind/llvm-libunwind.hash | 2 +-
 package/llvm-project/llvm-project.mk                    | 2 +-
 package/llvm-project/llvm-runtimes/llvm-runtimes.hash   | 2 +-
 package/llvm-project/llvm/llvm.hash                     | 4 ++--
 9 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/llvm-project/clang/clang.hash b/package/llvm-project/clang/clang.hash
index 74fc755e25..5ac73a252c 100644
--- a/package/llvm-project/clang/clang.hash
+++ b/package/llvm-project/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  eee4de3b3f01ea6dd6b0936ac8be319eef0a65d0022def258c70110e3743807c  clang-21.1.5.src.tar.xz
+sha256  348ace5d715c4caa6fb89b4c6fe07c21650e10b2fac37d8b0db75c0b11be9011  clang-21.1.6.src.tar.xz
 sha256  ebcd9bbf783a73d05c53ba4d586b8d5813dcdf3bbec50265860ccc885e606f47  LICENSE.TXT
diff --git a/package/llvm-project/compiler-rt/compiler-rt.hash b/package/llvm-project/compiler-rt/compiler-rt.hash
index 01e7d05169..b9ec906595 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.hash
+++ b/package/llvm-project/compiler-rt/compiler-rt.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  967c2afba250b325ba4482b12a819ef8cbee178eed45d7b5e14f0368b05adedf  compiler-rt-21.1.5.src.tar.xz
-sha256  4ccc00ec2e7bd0cc121eaa34fa25a0480bfb8a5722faf1694720e0be99b753e6  third-party-21.1.5.src.tar.xz
+sha256  bdd904f3aac9f4c4424f3440aff498cc04d66f243e37156b6d167ffb7b599f89  compiler-rt-21.1.6.src.tar.xz
+sha256  8d09dc219cdb3da7dafd2161836aacdd6e02c1a113498ab5f37688599406dc8a  third-party-21.1.6.src.tar.xz
 sha256  1a8f1058753f1ba890de984e48f0242a3a5c29a6a8f2ed9fd813f36985387e8d  LICENSE.TXT
diff --git a/package/llvm-project/libclc/libclc.hash b/package/llvm-project/libclc/libclc.hash
index bd603a0c21..92b51fc1fa 100644
--- a/package/llvm-project/libclc/libclc.hash
+++ b/package/llvm-project/libclc/libclc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  1fc88ddae5965b66e94de74fb294b7dfdf5827f3abb22a8657e8e03c6c9b381f  libclc-21.1.5.src.tar.xz
+sha256  a1a09ccfa17f2d5fbe5e54271a4a9fbe396950f29f80f52b67a7083fee73120c  libclc-21.1.6.src.tar.xz
 sha256  3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479  LICENSE.TXT
diff --git a/package/llvm-project/lld/lld.hash b/package/llvm-project/lld/lld.hash
index 9b8d60e487..b05f1e30f9 100644
--- a/package/llvm-project/lld/lld.hash
+++ b/package/llvm-project/lld/lld.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  2bcbb2b12af99fc3292d2a415e5678de0bee7182712d7deb89a7e0a52704a210  lld-21.1.5.src.tar.xz
+sha256  5b297faecdddc9581c260a1570b4c0ec8810d1213e23d7aa84732c0e2feea85f  lld-21.1.6.src.tar.xz
 sha256  f7891568956e34643eb6a0db1462db30820d40d7266e2a78063f2fe233ece5a0  LICENSE.TXT
diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.hash b/package/llvm-project/llvm-cmake/llvm-cmake.hash
index 3dfa67a294..402a5f4ef7 100644
--- a/package/llvm-project/llvm-cmake/llvm-cmake.hash
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.hash
@@ -1,2 +1,2 @@
 # locally calculated
-sha256  48013d5714a96419bf993a2e5e4c5827377e8cf9c565070731fb2305d50d9511  cmake-21.1.5.src.tar.xz
+sha256  e364f135fa14c343d70cac96f577f44e8e20bf026682f647f8c3c5687a0bebd1  cmake-21.1.6.src.tar.xz
diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
index 0a7a966498..7326a0d863 100644
--- a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  8a2cd813ea15dbd879ebeefa2eceedce8937715ac78b6df44da140e40768725f  libunwind-21.1.5.src.tar.xz
+sha256  25d8bf5bd0d95641c738ea690b18564f5fc9fb7e7bbab17329b391988e71ae8c  libunwind-21.1.6.src.tar.xz
 sha256  b5efebcaca80879234098e52d1725e6d9eb8fb96a19fce625d39184b705f7b6d  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 2e9d9d0513..268367d6bd 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 21
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.5
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.6
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 
 include $(sort $(wildcard package/llvm-project/*/*.mk))
diff --git a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
index 58b764dd99..c68f1c13ff 100644
--- a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
+++ b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
@@ -1,2 +1,2 @@
 # locally calculated
-sha256  2454cfbfc16266e1858df4ddbe1bc9dc16e0679f8058b6c618e3f6e7e05623a7  runtimes-21.1.5.src.tar.xz
+sha256  3b2dcaec1163caf067988228c1d21a75334c47d22610956dd9699ea0631bce45  runtimes-21.1.6.src.tar.xz
diff --git a/package/llvm-project/llvm/llvm.hash b/package/llvm-project/llvm/llvm.hash
index ab9995d14a..1738c94d29 100644
--- a/package/llvm-project/llvm/llvm.hash
+++ b/package/llvm-project/llvm/llvm.hash
@@ -1,4 +1,4 @@
 # locally calculated
-sha256  c9d6ca5073255192850471a276b3a00a6555c6dd09df6cb3eab77801f0a1cae0  llvm-21.1.5.src.tar.xz
-sha256  4ccc00ec2e7bd0cc121eaa34fa25a0480bfb8a5722faf1694720e0be99b753e6  third-party-21.1.5.src.tar.xz
+sha256  908bce97be0275943414b45af2e2b20e8f6d5d9266fdc120bd59f096ebc547ad  llvm-21.1.6.src.tar.xz
+sha256  8d09dc219cdb3da7dafd2161836aacdd6e02c1a113498ab5f37688599406dc8a  third-party-21.1.6.src.tar.xz
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
