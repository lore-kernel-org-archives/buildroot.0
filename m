Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728DAC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 19:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0990A40B64;
	Mon, 20 Jun 2022 19:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0990A40B64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UhiACqcZ_1UJ; Mon, 20 Jun 2022 19:34:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13A63405B3;
	Mon, 20 Jun 2022 19:34:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13A63405B3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 94C921BF3FD
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7019283E3D
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 19:34:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7019283E3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dd91h4L0Q5Zl for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 19:34:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A03B383E18
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 19:34:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A03B383E18
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BFB88874DD; Mon, 20 Jun 2022 19:22:31 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 20 Jun 2022 20:32:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a9a6d4fab644bd8800f1e331b07c9dcbd36f8a7
X-Git-Newrev: 948dd3548099ef94b372c456e3154f70b4815f19
X-Patchwork-Hint: ignore
Message-Id: <20220620192231.BFB88874DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lld: bump to version 11.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=948dd3548099ef94b372c456e3154f70b4815f19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lld/lld.hash | 4 ++--
 package/lld/lld.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lld/lld.hash b/package/lld/lld.hash
index 2144cc5666..6d56ffcaab 100644
--- a/package/lld/lld.hash
+++ b/package/lld/lld.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 86262bad3e2fd784ba8c5e2158d7aa36f12b85f2515e95bc81d65d75bb9b0c82  lld-9.0.1.src.tar.xz
-sha256 f7891568956e34643eb6a0db1462db30820d40d7266e2a78063f2fe233ece5a0  LICENSE.TXT
+sha256  017a788cbe1ecc4a949abf10755870519086d058a2e99f438829aef24f0c66ce  lld-11.1.0.src.tar.xz
+sha256  f7891568956e34643eb6a0db1462db30820d40d7266e2a78063f2fe233ece5a0  LICENSE.TXT
diff --git a/package/lld/lld.mk b/package/lld/lld.mk
index cd1a03c1d3..4bf903cda0 100644
--- a/package/lld/lld.mk
+++ b/package/lld/lld.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # LLVM, Clang and lld should be version bumped together
-LLD_VERSION = 9.0.1
+LLD_VERSION = 11.1.0
 LLD_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLD_VERSION)
 LLD_SOURCE = lld-$(LLD_VERSION).src.tar.xz
 LLD_LICENSE = Apache-2.0 with exceptions
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
