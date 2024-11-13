Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538C6D41C2B
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 09:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D01680B1E;
	Wed, 13 Nov 2024 09:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TEmmy3bV22Zv; Wed, 13 Nov 2024 09:54:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 632A080AED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 632A080AED;
	Wed, 13 Nov 2024 09:54:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 186991DC4
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 302644047A
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QRlmjfz-_Bip for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 09:53:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9748B40B05
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9748B40B05
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:53:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 946D786226; Wed, 13 Nov 2024 09:53:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Nov 2024 09:36:28 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 5e936ceac79b8af1885df9bafa0398de291218ff
X-Git-Newrev: 1340ae1843dd6bd8bf2e8afe11db0f91c1a4c7d3
X-Patchwork-Hint: ignore
Message-Id: <20241113095351.946D786226@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] docs/website: fix the
 link to the mailman archives
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1340ae1843dd6bd8bf2e8afe11db0f91c1a4c7d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b07ee5e41c806138dd8d214b842dabdb802dd64f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/support.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/website/support.html b/docs/website/support.html
index 13d63b13a9..7f9628c238 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -53,7 +53,7 @@
 		    page</a>.  Only subscribers to the Buildroot
 		    mailing list are allowed to post to this
 		    list. Archives are available
-		    from <a href="/lists/buildroot/">Mailman</a>
+		    from <a href="https://lists.buildroot.org/pipermail/buildroot/">Mailman</a>
 		    and <a href="https://lore.kernel.org/buildroot/">lore.kernel.org</a>.
 
 		  <h4>Search the List Archives</h4>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
