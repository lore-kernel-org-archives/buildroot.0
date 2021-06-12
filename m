Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE107C432BE
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:50:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D0CB6104F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D0CB6104F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65B0083A79;
	Tue,  3 Aug 2021 21:50:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mZ1R6DR7Uz0r; Tue,  3 Aug 2021 21:50:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64D95838ED;
	Tue,  3 Aug 2021 21:50:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F9DA1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3247B6089E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CAC38zxQQyts for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AEBD608AE
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D319185D40; Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Jun 2021 23:09:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5d5c619410bdb164ce0371e81e67ac3157e63394
X-Git-Newrev: 2e1e9d2ebd5d59b3120c2ccfc6571eadb6745e4f
X-Patchwork-Hint: ignore
Message-Id: <20210803210949.D319185D40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] docs/website: change wording
 about training provided by Bootlin
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

commit: https://git.buildroot.net/buildroot/commit/?id=2e1e9d2ebd5d59b3120c2ccfc6571eadb6745e4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As suggested by Yann, let's avoid announcing the exact date of the
next course, as it gets outdated very often. Instead, use a more
generic wording and simply point to a Bootlin page that has all the
details.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/website/docs.html | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/docs/website/docs.html b/docs/website/docs.html
index e8d8138565..85b005004d 100644
--- a/docs/website/docs.html
+++ b/docs/website/docs.html
@@ -108,14 +108,13 @@
 	  </div>
 
 	  <div class="panel panel-default">
-	    <div class="panel-heading">Public training course</div>
+	    <div class="panel-heading">Public online training course</div>
 	    <div class="panel-body">
-	      The next online public training course on Buildroot
-	      organized
-	      by <a href="https://www.bootlin.com">Bootlin</a> will
-	      take place from May 31 to June 4, 2021, with Thomas Petazzoni as
-	      trainer. <a href="https://bootlin.com/training/buildroot/">Infos</a>
-	      and <a href="https://www.eventbrite.com/e/bootlin-embedded-linux-development-with-buildroot-training-seminar-tickets-145276318379">registration</a>.
+	      Regular online training courses, available to individual
+	      registration, are proposed by Bootlin, with Thomas
+	      Petazzoni as
+	      trainer. See <a href="https://bootlin.com/training/buildroot/">next
+	      dates and registration details</a>.
 	    </div>
 	  </div>
 	</div>
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
