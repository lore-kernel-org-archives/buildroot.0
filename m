Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1056FC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:53:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C60EC60F01
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C60EC60F01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 945A440673;
	Wed,  4 Aug 2021 00:53:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v3DpfBFUD3cd; Wed,  4 Aug 2021 00:53:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A23DB40624;
	Wed,  4 Aug 2021 00:53:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02C5A1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B8B440F0F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z0Sa53dfPbgi for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B96F040FB5
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0981787C2D; Tue,  3 Aug 2021 21:10:23 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 29 Jul 2021 22:59:44 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1431dbf9b6dd92a350b1eb59d04bc2d519b1c24a
X-Git-Newrev: 6865bd20846175e6b6e308b81d6f95c1b84a6bdf
X-Patchwork-Hint: ignore
Message-Id: <20210803211023.0981787C2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] docs/website: mention mailing
 list archives at lore.kernel.org
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=6865bd20846175e6b6e308b81d6f95c1b84a6bdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/support.html | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/docs/website/support.html b/docs/website/support.html
index eef969d461..97ca296836 100644
--- a/docs/website/support.html
+++ b/docs/website/support.html
@@ -45,11 +45,14 @@
 		  <img class="img-responsive" src="images/email.png" style="max-width:50px; margin-bottom:10px;">
 		</div>
 		<div class="col-sm-11">
-		  <p>The <a href="/lists/buildroot/">mailing list</a> is for discussion and
+		  <p>The mailing list is for discussion and
 		    development.  You can subscribe by visiting
-		    <a href="http://lists.buildroot.org/mailman/listinfo/buildroot">this page</a>.
-		    Only subscribers to the Buildroot mailing list are allowed to post
-		    to this list.</p>
+		    <a href="http://lists.buildroot.org/mailman/listinfo/buildroot">this
+		    page</a>.  Only subscribers to the Buildroot
+		    mailing list are allowed to post to this
+		    list. Archives are available
+		    from <a href="/lists/buildroot/">Mailman</a>
+		    and <a href="https://lore.kernel.org/buildroot/">lore.kernel.org</a>.
 
 		  <h4>Search the List Archives</h4>
 		  <p>Please search the mailing list archives before asking questions on the mailing
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
