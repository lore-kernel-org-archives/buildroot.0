Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEE3EE01E8
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB4D860AA6;
	Tue, 10 Sep 2024 20:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HQ4ocd9KSEH8; Tue, 10 Sep 2024 20:52:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B74160AB9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B74160AB9;
	Tue, 10 Sep 2024 20:52:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 25AB11BF95A
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B82340B47
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y8cO4PkQR9-I for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:51:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B90C0408D9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B90C0408D9
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:51:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B575986F60; Tue, 10 Sep 2024 20:51:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 22:49:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6cb031802d100b36c086b1a732bf887bf4304aab
X-Git-Newrev: cd6584715ea4cec33d587ccb965fc599081c6233
X-Patchwork-Hint: ignore
Message-Id: <20240910205130.B575986F60@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/news.html: fix information
 typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd6584715ea4cec33d587ccb965fc599081c6233
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Plural of information is also information.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/website/news.html | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/website/news.html b/docs/website/news.html
index fff88e49e2..32a19af69d 100644
--- a/docs/website/news.html
+++ b/docs/website/news.html
@@ -7394,7 +7394,7 @@
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Various fixes, and
-	  addition of licensing informations on many
+	  addition of licensing information on many
 	  packages. See <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.08_rc3">CHANGES</a>
 	  file for details</p>
 
@@ -7416,7 +7416,7 @@
       </div>
       <div class="timeline-body">
 	<p>We have a new release candidate! Various fixes, and addition
-	  of licensing informations on many
+	  of licensing information on many
 	  packages. See <a href="http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.08_rc2">CHANGES</a>
 	  file for details</p>
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
