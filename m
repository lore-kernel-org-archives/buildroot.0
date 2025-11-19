Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D396CF58DF
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 20:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2038183E08;
	Wed, 19 Nov 2025 20:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RE8JFuPwLpa7; Wed, 19 Nov 2025 20:09:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B01D183D4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B01D183D4B;
	Wed, 19 Nov 2025 20:09:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A4802A9
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 079334103D
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:08:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ioWqrrStOmZo for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 20:08:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34C5B4103C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34C5B4103C
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 20:08:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 202B785518; Wed, 19 Nov 2025 20:08:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 19 Nov 2025 21:08:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4298e21e0ab90f43a022d47214665e651ff025b7
X-Git-Newrev: 45a9ca057f77e376ab06d7da7817cdc89081666d
X-Patchwork-Hint: ignore
Message-Id: <20251119200858.202B785518@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project: bump to version
 21.1.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=45a9ca057f77e376ab06d7da7817cdc89081666d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://discourse.llvm.org/t/llvm-21-1-5-released/88776

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
index 3abedbab85..74fc755e25 100644
--- a/package/llvm-project/clang/clang.hash
+++ b/package/llvm-project/clang/clang.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  3e8e25a7478bfb0ef510fff35d1a43bdfb62c7727bf98bb43ad33deef2f9f1a2  clang-21.1.4.src.tar.xz
+sha256  eee4de3b3f01ea6dd6b0936ac8be319eef0a65d0022def258c70110e3743807c  clang-21.1.5.src.tar.xz
 sha256  ebcd9bbf783a73d05c53ba4d586b8d5813dcdf3bbec50265860ccc885e606f47  LICENSE.TXT
diff --git a/package/llvm-project/compiler-rt/compiler-rt.hash b/package/llvm-project/compiler-rt/compiler-rt.hash
index 9e10f6cd92..01e7d05169 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.hash
+++ b/package/llvm-project/compiler-rt/compiler-rt.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  84fed7aa95bfac348642a753d332afd303a0847b1fe1e76acf13fe98f8760d5f  compiler-rt-21.1.4.src.tar.xz
-sha256  ae8658390504e08e464f65ecea838a0584df4734c27cecedfe7eb32780e81564  third-party-21.1.4.src.tar.xz
+sha256  967c2afba250b325ba4482b12a819ef8cbee178eed45d7b5e14f0368b05adedf  compiler-rt-21.1.5.src.tar.xz
+sha256  4ccc00ec2e7bd0cc121eaa34fa25a0480bfb8a5722faf1694720e0be99b753e6  third-party-21.1.5.src.tar.xz
 sha256  1a8f1058753f1ba890de984e48f0242a3a5c29a6a8f2ed9fd813f36985387e8d  LICENSE.TXT
diff --git a/package/llvm-project/libclc/libclc.hash b/package/llvm-project/libclc/libclc.hash
index 8e9663ff8d..bd603a0c21 100644
--- a/package/llvm-project/libclc/libclc.hash
+++ b/package/llvm-project/libclc/libclc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  2311128b86ae95b4319341671a8ec93950928d0bc4fa13d0e6a97d7a65507aaa  libclc-21.1.4.src.tar.xz
+sha256  1fc88ddae5965b66e94de74fb294b7dfdf5827f3abb22a8657e8e03c6c9b381f  libclc-21.1.5.src.tar.xz
 sha256  3c536c052db9afd997809e38785c9f2a9e54e2892330fa7c5b438e18a7413479  LICENSE.TXT
diff --git a/package/llvm-project/lld/lld.hash b/package/llvm-project/lld/lld.hash
index 707e2ba56f..9b8d60e487 100644
--- a/package/llvm-project/lld/lld.hash
+++ b/package/llvm-project/lld/lld.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  5d62eb36eb76ac9cc9179f31a355d28fc3a1c4096880da2a12090cfe1ccd3dcf  lld-21.1.4.src.tar.xz
+sha256  2bcbb2b12af99fc3292d2a415e5678de0bee7182712d7deb89a7e0a52704a210  lld-21.1.5.src.tar.xz
 sha256  f7891568956e34643eb6a0db1462db30820d40d7266e2a78063f2fe233ece5a0  LICENSE.TXT
diff --git a/package/llvm-project/llvm-cmake/llvm-cmake.hash b/package/llvm-project/llvm-cmake/llvm-cmake.hash
index 7b4df505c4..3dfa67a294 100644
--- a/package/llvm-project/llvm-cmake/llvm-cmake.hash
+++ b/package/llvm-project/llvm-cmake/llvm-cmake.hash
@@ -1,2 +1,2 @@
 # locally calculated
-sha256  f4316d84a862ba3023ca1d26bd9c6a995516b4fa028b6fb329d22e24cc6d235e  cmake-21.1.4.src.tar.xz
+sha256  48013d5714a96419bf993a2e5e4c5827377e8cf9c565070731fb2305d50d9511  cmake-21.1.5.src.tar.xz
diff --git a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
index 36ef3167d4..0a7a966498 100644
--- a/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
+++ b/package/llvm-project/llvm-libunwind/llvm-libunwind.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  fc3ca27e1094b5fd4b7c1879e83705d89e9a2632b9a43426eb96c0536ace5345  libunwind-21.1.4.src.tar.xz
+sha256  8a2cd813ea15dbd879ebeefa2eceedce8937715ac78b6df44da140e40768725f  libunwind-21.1.5.src.tar.xz
 sha256  b5efebcaca80879234098e52d1725e6d9eb8fb96a19fce625d39184b705f7b6d  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 6d324ede51..2e9d9d0513 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 21
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.4
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.5
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 
 include $(sort $(wildcard package/llvm-project/*/*.mk))
diff --git a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
index 3564e2341a..58b764dd99 100644
--- a/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
+++ b/package/llvm-project/llvm-runtimes/llvm-runtimes.hash
@@ -1,2 +1,2 @@
 # locally calculated
-sha256  d84e6d3a28f0c877e4ab6884e8bedb3a1d2094352bba2f0d74073abb817b996a  runtimes-21.1.4.src.tar.xz
+sha256  2454cfbfc16266e1858df4ddbe1bc9dc16e0679f8058b6c618e3f6e7e05623a7  runtimes-21.1.5.src.tar.xz
diff --git a/package/llvm-project/llvm/llvm.hash b/package/llvm-project/llvm/llvm.hash
index 78f830ec48..ab9995d14a 100644
--- a/package/llvm-project/llvm/llvm.hash
+++ b/package/llvm-project/llvm/llvm.hash
@@ -1,4 +1,4 @@
 # locally calculated
-sha256  f311681255deb37f74bbf950a653e9434e7d8383a7b46a603a323c46cd4bf50e  llvm-21.1.4.src.tar.xz
-sha256  ae8658390504e08e464f65ecea838a0584df4734c27cecedfe7eb32780e81564  third-party-21.1.4.src.tar.xz
+sha256  c9d6ca5073255192850471a276b3a00a6555c6dd09df6cb3eab77801f0a1cae0  llvm-21.1.5.src.tar.xz
+sha256  4ccc00ec2e7bd0cc121eaa34fa25a0480bfb8a5722faf1694720e0be99b753e6  third-party-21.1.5.src.tar.xz
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
