Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900D7C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 14:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 273B441609;
	Mon,  4 Dec 2023 14:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 273B441609
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AH0j_ZltStTc; Mon,  4 Dec 2023 14:26:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86C3041720;
	Mon,  4 Dec 2023 14:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86C3041720
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D8CC51BF33A
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 14:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2457814B7
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 14:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2457814B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lwp-D5VKatbR for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 14:26:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6FA7814B5
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 14:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6FA7814B5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D39B0879A7; Mon,  4 Dec 2023 14:26:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Dec 2023 15:25:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c68824f25b6e053466995c4c3665095ecdabe08
X-Git-Newrev: 8d2526701b86e8efdcb8ac85b1b3d6421ed87b71
X-Patchwork-Hint: ignore
Message-Id: <20231204142609.D39B0879A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Kickoff 2024.02 cycle
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d2526701b86e8efdcb8ac85b1b3d6421ed87b71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index e422e97214..ac625152c6 100644
--- a/Makefile
+++ b/Makefile
@@ -90,7 +90,7 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.11
+export BR2_VERSION := 2024.02-git
 # Actual time the release is cut (for reproducible builds)
 BR2_VERSION_EPOCH = 1701677000
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
