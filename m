Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E51D41C27
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 09:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 130C980415;
	Wed, 13 Nov 2024 09:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hl3foxir4fDw; Wed, 13 Nov 2024 09:55:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AF28813EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AF28813EC;
	Wed, 13 Nov 2024 09:55:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 884131531
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B0894045A
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QDTouAlvDG1Z for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 09:55:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 809634027F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 809634027F
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 09:55:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BEB386286; Wed, 13 Nov 2024 09:55:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Nov 2024 09:36:32 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 2c61a66f216a5d3de628dad89b2d986bd4f4868c
X-Git-Newrev: 4244da4fe4b1a13b935f60304ce18eda32a2dc76
X-Patchwork-Hint: ignore
Message-Id: <20241113095505.7BEB386286@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] docs/website: fix the
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

commit: https://git.buildroot.net/buildroot/commit/?id=4244da4fe4b1a13b935f60304ce18eda32a2dc76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b07ee5e41c806138dd8d214b842dabdb802dd64f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
