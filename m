Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8D5CF6487
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 22:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9056611FA;
	Wed, 19 Nov 2025 22:39:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PACTX6iD7Sbv; Wed, 19 Nov 2025 22:39:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C90C7611F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C90C7611F0;
	Wed, 19 Nov 2025 22:39:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CE3A37D
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 22:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 435F8410A5
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 22:39:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mXWNwz5CY_4I for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 22:38:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F5B3410A3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F5B3410A3
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 22:38:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28AA6856F5; Wed, 19 Nov 2025 22:38:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 19 Nov 2025 21:42:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc5a1d3daa8f270520dae454d2704f2b21b5c94a
X-Git-Newrev: 658e2287bfc56e547fd57671fab621ecabbd4eb8
X-Patchwork-Hint: ignore
Message-Id: <20251119223859.28AA6856F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spirv-llvm-translator: bump
 version to 21.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=658e2287bfc56e547fd57671fab621ecabbd4eb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/KhronosGroup/SPIRV-LLVM-Translator/releases/tag/v21.1.2

Changelog:
https://github.com/KhronosGroup/SPIRV-LLVM-Translator/compare/v21.1.1...v21.1.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/spirv-llvm-translator/spirv-llvm-translator.hash | 2 +-
 package/spirv-llvm-translator/spirv-llvm-translator.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
index f0b8214976..0263689519 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  954ef00a48fc440f3624f78cc80ffa98c961510bf558489ea0a940e397c7a871  spirv-llvm-translator-v21.1.1-2-ga37544fc0bb90b4e8b8d755580119c018891dfa4.tar.gz
+sha256  8db031b9e23c1dd47154751cf74f8a3c5d5e8d92896789c6a7eb956946287677  spirv-llvm-translator-v21.1.2-5-g3c0231e56b7a9ecc4875e8696ea53d54d6776f85.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 62a24f1ff1..28bdb4d26f 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -6,7 +6,7 @@
 
 # Generate version string using:
 #   git describe --tags --match 'v21*' --abbrev=40 origin/llvm_release_210
-SPIRV_LLVM_TRANSLATOR_VERSION = v21.1.1-2-ga37544fc0bb90b4e8b8d755580119c018891dfa4
+SPIRV_LLVM_TRANSLATOR_VERSION = v21.1.2-5-g3c0231e56b7a9ecc4875e8696ea53d54d6776f85
 SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
