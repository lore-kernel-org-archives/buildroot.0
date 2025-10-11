Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776ECCCA476
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 21:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 340F040A56;
	Sat, 11 Oct 2025 21:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ukIu1zh3ejzN; Sat, 11 Oct 2025 21:19:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5492F40BB8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5492F40BB8;
	Sat, 11 Oct 2025 21:19:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EC255119
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D225480F9F
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QS1_Ciwx_NhM for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 21:19:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0337F80F37
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0337F80F37
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:19:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E17B786E8B; Sat, 11 Oct 2025 21:19:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 Oct 2025 23:14:29 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b65f78267e518df8fa8a5e970943f81573b7a9fa
X-Git-Newrev: 0bb49547c347ecd0181cdb1ee5de9b591cb9d5c7
X-Patchwork-Hint: ignore
Message-Id: <20251011211940.E17B786E8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Makefile: update for
 2025.02.7
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0bb49547c347ecd0181cdb1ee5de9b591cb9d5c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 7b86ff7f80..8b69318233 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.02.6
+export BR2_VERSION := 2025.02.7
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1757446200
+BR2_VERSION_EPOCH = 1760217300
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
