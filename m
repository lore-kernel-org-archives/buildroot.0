Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EC9C7115B
	for <buildroot@archiver.kernel.org>; Mon, 23 Jun 2025 17:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E68E540AB2;
	Mon, 23 Jun 2025 17:04:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ynV5b5oOSba; Mon, 23 Jun 2025 17:04:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E5A040A8E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E5A040A8E;
	Mon, 23 Jun 2025 17:04:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AFA25154
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 17:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9628E606DB
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 17:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yfV0maZG-iDJ for <buildroot@buildroot.org>;
 Mon, 23 Jun 2025 17:04:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05ACB60697
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05ACB60697
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 17:04:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6E4F83F58; Mon, 23 Jun 2025 17:04:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 23 Jun 2025 19:02:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b41e499cdd364368563332975485ed46eb7c47c
X-Git-Newrev: 333e527682670946cfc83165edf119c6094940fc
X-Patchwork-Hint: ignore
Message-Id: <20250623170406.D6E4F83F58@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/news.html: fix date of
 2025.02.4 release
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

commit: https://git.buildroot.net/buildroot/commit/?id=333e527682670946cfc83165edf119c6094940fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 docs/website/news.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/website/news.html b/docs/website/news.html
index fd8a270651..91b3569f12 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -14,7 +14,7 @@
     <div class="timeline-panel">
       <div class="timeline-heading">
 	<h4 class="timeline-title">2025.02.4 released</h4>
-	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>19 May 2025</small></p>
+	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i>23 June 2025</small></p>
       </div>
       <div class="timeline-body">
 	<p>The 2025.02.4 bugfix release is out, fixing a number of important /
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
