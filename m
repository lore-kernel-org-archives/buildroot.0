Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69EAC433FE
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 16:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57C3284027;
	Sat,  1 Oct 2022 16:33:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57C3284027
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HLpQhXcqEI_L; Sat,  1 Oct 2022 16:33:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6222784006;
	Sat,  1 Oct 2022 16:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6222784006
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E6AF71BF59C
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1804402FD
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:33:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1804402FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7DPUJ6GwHK2d for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 16:33:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6D91402D2
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 16:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6D91402D2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1E418648E; Sat,  1 Oct 2022 16:33:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Oct 2022 18:32:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e65d768dbc41912451eaebf7f111541a672ba98c
X-Git-Newrev: cc7bbbeac82eac9fdc9a752cd8ca10a263f8349d
X-Patchwork-Hint: ignore
Message-Id: <20221001163310.B1E418648E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spirv-llvm-translator: bump to
 version 11.0.0-297
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc7bbbeac82eac9fdc9a752cd8ca10a263f8349d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/spirv-llvm-translator/spirv-llvm-translator.hash | 2 +-
 package/spirv-llvm-translator/spirv-llvm-translator.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.hash b/package/spirv-llvm-translator/spirv-llvm-translator.hash
index 6133b1326a..edfca1ea02 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.hash
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  bcb0e5ae2d15f9876551fda46b222f911ed5afd626dfbcc66ddea9d36563ac9c  spirv-llvm-translator-v11.0.0-269-g13c76c4b275ae990d23883f7f15eec1a9adddc18.tar.gz
+sha256  bdd7cb677b9fcaaff1cce2153de9d69298f136edecaef3631915614bb5db09a1  spirv-llvm-translator-v11.0.0-297-ga619b34bce55360d79fea9058a93ded04919f2b2.tar.gz
 sha256  e3bc36440fc927c62d5cc24efeefe225a14d4e34ffeb0c92e430625cce9ee444  LICENSE.TXT
diff --git a/package/spirv-llvm-translator/spirv-llvm-translator.mk b/package/spirv-llvm-translator/spirv-llvm-translator.mk
index 73f7fe02de..159f7d3b52 100644
--- a/package/spirv-llvm-translator/spirv-llvm-translator.mk
+++ b/package/spirv-llvm-translator/spirv-llvm-translator.mk
@@ -6,7 +6,7 @@
 
 # Generate version string using:
 #   git describe --tags --match 'v11*' --abbrev=40 origin/llvm_release_110
-SPIRV_LLVM_TRANSLATOR_VERSION = v11.0.0-269-g13c76c4b275ae990d23883f7f15eec1a9adddc18
+SPIRV_LLVM_TRANSLATOR_VERSION = v11.0.0-297-ga619b34bce55360d79fea9058a93ded04919f2b2
 SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
 SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
 SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
