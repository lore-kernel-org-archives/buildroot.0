Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5BCC43217
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 15:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 931C140B63;
	Thu,  3 Nov 2022 15:55:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 931C140B63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KRxAqXN1KvMn; Thu,  3 Nov 2022 15:55:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE240404B9;
	Thu,  3 Nov 2022 15:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE240404B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A8FC1BF3BF
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 15:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D38BB404BF
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 15:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D38BB404BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1A6qxeg_dxU0 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 15:55:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C49F404B0
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 15:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C49F404B0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0823B87BB2; Thu,  3 Nov 2022 15:55:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 16:48:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e40d6d40a6ccda3b5dffe8c45e0b833f592a48c7
X-Git-Newrev: 959610fd79ec8a9fa8482841a964b2c95a3ffa0d
X-Patchwork-Hint: ignore
Message-Id: <20221103155551.0823B87BB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/news.html: fix 2022.08.1 entry
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

commit: https://git.buildroot.net/buildroot/commit/?id=959610fd79ec8a9fa8482841a964b2c95a3ffa0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This was naturally about 2022.08.1, NOT 2022.05.1.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/news.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/website/news.html b/docs/website/news.html
index ecd578fd6f..e2a32c76cb 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -13,7 +13,7 @@
     <div class="timeline-badge"><i class="glyphicon glyphicon-thumbs-up"></i></div>
     <div class="timeline-panel">
       <div class="timeline-heading">
-	<h4 class="timeline-title">2022.05.1 released</h4>
+	<h4 class="timeline-title">2022.08.1 released</h4>
 	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>3 October 2022</small></p>
       </div>
       <div class="timeline-body">
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
