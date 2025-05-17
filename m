Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F07FC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E4AF71007;
	Mon, 19 May 2025 11:03:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JHIKrzAtvazk; Mon, 19 May 2025 11:03:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7AEE71001
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7AEE71001;
	Mon, 19 May 2025 11:03:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A98FE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C8C640DFD
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lXPHwbjTEHcE for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48FFC41E3B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48FFC41E3B
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4588981E90; Mon, 19 May 2025 10:40:07 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 12:39:37 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d0fe20e891a8ac2bd724c3359e1e7c0cf9a96553
X-Git-Newrev: 9aa966863f382e7eddd8101b42599cdd585f9ce9
X-Patchwork-Hint: ignore
Message-Id: <20250519104007.4588981E90@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/llvm-project: bump to
 version 15.0.7
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9aa966863f382e7eddd8101b42599cdd585f9ce9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For release notes since 15.0.3, see:
https://discourse.llvm.org/t/llvm-15-0-4-released/66337
https://discourse.llvm.org/t/llvm-15-0-5-release/66616
https://discourse.llvm.org/t/llvm-15-0-6-released/66899
https://discourse.llvm.org/t/llvm-15-0-7-release/67638

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: add links to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/llvm-project/clang/clang.hash                   | 2 +-
 package/llvm-project/compiler-rt/compiler-rt.hash       | 2 +-
 package/llvm-project/libclc/libclc.hash                 | 2 +-
 package/llvm-project/lld/lld.hash                       | 2 +-
 package/llvm-project/llvm-cmake/llvm-cmake.hash         | 2 +-
 package/llvm-project/llvm-libunwind/llvm-libunwind.hash | 2 +-
 package/llvm-project/llvm-project.mk                    | 2 +-
 package/llvm-project/llvm/llvm.hash                     | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/llvm-project/clang/clang.hash b/package/llvm-project/clang/clang.hash
index 52c755cfb3..33b50af6bf 100644
--- a/package/llvm-project/clang/clang.hash
+++ b/package/llvm-project/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  96036052694e703d159c995bda203b59d1ff185c6879189b9eba837726e1738c  clang-15.0.3.src.tar.xz
+sha256  a6b673ef15377fb46062d164e8ddc4d05c348ff8968f015f7f4af03f51000067  clang-15.0.7.src.tar.xz
 sha256  ebcd9bbf783a73d05c53ba4d586b8d5813dcdf3bbec50265860ccc885e606f47  LICENSE.TXT
diff --git a/package/llvm-project/compiler-rt/compiler-rt.hash b/package/llvm-project/compiler-rt/compiler-rt.hash
index fe4e98164b..f84a8a33a7 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.hash
+++ b/package/llvm-project/compiler-rt/compiler-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  db958eee92d1571d8b7f76c1be8513817f1a888dcf6ced88aca871acfb0eeddd  compiler-rt-15.0.3.src.tar.xz
+sha256  353832c66cce60931ea0413b3c071faad59eefa70d02c97daa8978b15e4b25b7  compiler-rt-15.0.7.src.tar.xz
 sha256  1a8f1058753f1ba890de984e48f0242a3a5c29a6a8f2ed9fd813f36985387e8d  LICENSE.TXT
diff --git a/package/llvm-project/libclc/libclc.hash b/package/llvm-project/libclc/libclc.hash
index 7140884f6c..5ee088a379 100644
--- a/package/llvm-project/libclc/libclc.hash
+++ b/package/llvm-project/libclc/libclc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  07e8a2b31e07a8cc8a976a6bfd87797d2543d5a9530f449755bf5119acbdbe8e  libclc-15.0.3.src.tar.xz
+sha256  35731fea7be224f21acf5bf3cd9f0ed058bf4ada5eceaf7f10ee96e139bd3389  libclc-15.0.7.src.tar.xz
 sha256  3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479  LICENSE.TXT
diff --git a/package/llvm-project/lld/lld.hash b/package/llvm-project/lld/lld.hash
index 2d2598dbeb..b30e38f02b 100644
--- a/package/llvm-project/lld/lld.hash
+++ b/package/llvm-project/lld/lld.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  cd5d0894a74b957ce78d62212c1df0b3876a7297593aaece6b0512285e3b8732  lld-15.0.3.src.tar.xz
+sha256  dba5c70c3fe88b3a38b9180df82fbc9d1dfd55d68f41fddd6a90f9e17f8e5df9  lld-15.0.7.src.tar.xz
 sha256  f7891568956e34643eb6a0db1462db30820d40d7266e2a78063f2fe233ece5a0  LICENSE.TXT
diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.hash b/package/llvm-project/llvm-cmake/llvm-cmake.hash
index 862c5d92e8..756404cdd9 100644
--- a/package/llvm-project/llvm-cmake/llvm-cmake.hash
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.hash
@@ -1,2 +1,2 @@
 # locally calculated
-sha256  21cf3f52c53dc8b8972122ae35a5c18de09c7df693b48b5cd8553c3e3fed090d  cmake-15.0.3.src.tar.xz
+sha256  8986f29b634fdaa9862eedda78513969fe9788301c9f2d938f4c10a3e7a3e7ea  cmake-15.0.7.src.tar.xz
diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
index 86775f5dba..58a3230301 100644
--- a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  0ab6e07bf05359e242e9ea80e4089b819914867fa997a715e324e584bcfdf114  libunwind-15.0.3.src.tar.xz
+sha256  406d199ae3a16add84017f40458a5e7c31f9412937fcb518715af0a0eeafbc0c  libunwind-15.0.7.src.tar.xz
 sha256  b5efebcaca80879234098e52d1725e6d9eb8fb96a19fce625d39184b705f7b6d  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 5859ff7cfc..6f075793a5 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 15
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).0.3
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).0.7
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 
 include $(sort $(wildcard package/llvm-project/*/*.mk))
diff --git a/package/llvm-project/llvm/llvm.hash b/package/llvm-project/llvm/llvm.hash
index df9aa88411..4325da6f6b 100644
--- a/package/llvm-project/llvm/llvm.hash
+++ b/package/llvm-project/llvm/llvm.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  c39aec729662416dcbf0bfe53a9786b34e7d93d02908a0779a2f6d83ad0a4a27  llvm-15.0.3.src.tar.xz
+sha256  4ad8b2cc8003c86d0078d15d987d84e3a739f24aae9033865c027abae93ee7a4  llvm-15.0.7.src.tar.xz
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
