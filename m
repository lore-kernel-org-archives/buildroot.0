Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71505C36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 20:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 223CA400D0;
	Mon, 24 Mar 2025 20:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5NuQLxNw0-pd; Mon, 24 Mar 2025 20:44:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C90E404C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C90E404C0;
	Mon, 24 Mar 2025 20:44:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8690AE0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C05581EC0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:44:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OXkFYnlEJpku for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 20:44:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDDF981EDA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDDF981EDA
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:44:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6ADA82875; Mon, 24 Mar 2025 20:44:06 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 24 Mar 2025 21:39:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76c588ed569cc771cc392001b5401e7871ba1138
X-Git-Newrev: e287bc7f44df312ace41f53416e763abe35aeaf7
X-Patchwork-Hint: ignore
Message-Id: <20250324204406.A6ADA82875@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 docs/website/images/openhomefoundation-logo.png: crop for better layout
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

commit: https://git.buildroot.net/buildroot/commit/?id=e287bc7f44df312ace41f53416e763abe35aeaf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Open Home Foundation logo is in a white area that is too large for
how we display it on the sponsors page. As a result, it ends up at the
bottom of the logo area and it looks very unbalanced.

Crop the logo to a tigher area. Since it is going to end up being
scaled, it's difficult to predict what the best size it is, but cropping
at a height of 300 pixels gives a visually pleasing layout at at least
some resolutions.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 docs/website/images/openhomefoundation-logo.png | Bin 9533 -> 7091 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/docs/website/images/openhomefoundation-logo.png b/docs/website/images/openhomefoundation-logo.png
index ef932fb2a9..1b359f2cec 100644
Binary files a/docs/website/images/openhomefoundation-logo.png and b/docs/website/images/openhomefoundation-logo.png differ
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
