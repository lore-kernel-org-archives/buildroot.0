Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46A3ECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 31 Aug 2022 19:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F2D34193B;
	Wed, 31 Aug 2022 19:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F2D34193B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4BKOKfKXKilz; Wed, 31 Aug 2022 19:11:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A0A141939;
	Wed, 31 Aug 2022 19:11:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A0A141939
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 854B31BF2BC
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 19:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E8B26114E
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 19:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E8B26114E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7DmBfsgZu2Q3 for <buildroot@lists.busybox.net>;
 Wed, 31 Aug 2022 19:10:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DD6B6113F
 for <buildroot@buildroot.org>; Wed, 31 Aug 2022 19:10:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DD6B6113F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 22473880E2; Wed, 31 Aug 2022 18:55:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 31 Aug 2022 21:09:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5fddfefb3f730df865532f8b7eba3ac2500596e7
X-Git-Newrev: 0f2c0c24d310cc7f9393be6ce37594fcadc63a5a
X-Patchwork-Hint: ignore
Message-Id: <20220831185542.22473880E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/news.html: correct 2022.05.1
 entry
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f2c0c24d310cc7f9393be6ce37594fcadc63a5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was naturally 2022.05.1, NOT 2021.05.1.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/website/news.html b/docs/website/news.html
index 6b8a5b3ba8..7d4338e743 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -72,7 +72,7 @@
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
       <div class="timeline-heading">
-	<h4 class="timeline-title">2021.05.1 released</h4>
+	<h4 class="timeline-title">2022.05.1 released</h4>
 	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>24 July 2022</small></p>
       </div>
       <div class="timeline-body">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
