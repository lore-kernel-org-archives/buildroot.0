Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E83CD5B14E
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 20:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB54F6070A;
	Mon, 28 Oct 2024 20:56:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z_ZzLV6B-udn; Mon, 28 Oct 2024 20:56:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C505560767
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C505560767;
	Mon, 28 Oct 2024 20:56:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B8884EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3581740471
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:56:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZRZ7sENlTki for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 20:56:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F9DB40015
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F9DB40015
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:56:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A0548447A; Mon, 28 Oct 2024 20:56:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 21:56:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67249a691d2671252d033931b54fd654769ca7ce
X-Git-Newrev: b07ee5e41c806138dd8d214b842dabdb802dd64f
X-Patchwork-Hint: ignore
Message-Id: <20241028205628.2A0548447A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: fix the link to the mailman
 archives
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b07ee5e41c806138dd8d214b842dabdb802dd64f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/support.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/website/support.html b/docs/website/support.html
index 6bcf4ffc22..21c6e0a34e 100644
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
