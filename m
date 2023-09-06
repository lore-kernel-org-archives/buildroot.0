Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854D1EE14D3
	for <buildroot@archiver.kernel.org>; Wed,  6 Sep 2023 20:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABEDE417DA;
	Wed,  6 Sep 2023 20:58:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABEDE417DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YQu8R9k--Ip5; Wed,  6 Sep 2023 20:58:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E75C401FB;
	Wed,  6 Sep 2023 20:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E75C401FB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5DA9C1BF983
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 20:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44A91611D6
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 20:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44A91611D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sKFOegVInS18 for <buildroot@lists.busybox.net>;
 Wed,  6 Sep 2023 20:58:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AC39611B4
 for <buildroot@buildroot.org>; Wed,  6 Sep 2023 20:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AC39611B4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65030869C1; Wed,  6 Sep 2023 20:58:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Sep 2023 22:57:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c79ba009d66aa0998b15beb75836c35d521ebd2
X-Git-Newrev: 56c674e155175ed696d6d300ed323510c1f6ff4c
X-Patchwork-Hint: ignore
Message-Id: <20230906205809.65030869C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Kickoff 2023.11 cycle
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

commit: https://git.buildroot.net/buildroot/commit/?id=56c674e155175ed696d6d300ed323510c1f6ff4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d017b7e0eb..19bd826834 100644
--- a/Makefile
+++ b/Makefile
@@ -90,7 +90,7 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2023.08
+export BR2_VERSION := 2023.11-git
 # Actual time the release is cut (for reproducible builds)
 BR2_VERSION_EPOCH = 1694030000
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
