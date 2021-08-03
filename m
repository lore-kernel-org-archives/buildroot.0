Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C51C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:16:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B5EC60524
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B5EC60524
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36C9E84405;
	Wed,  4 Aug 2021 01:16:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D_OPwYNM0sL7; Wed,  4 Aug 2021 01:16:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92887843EC;
	Wed,  4 Aug 2021 01:16:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2AFA51BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E940F414CE
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TW1AabbqWkEc for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8479340E7B
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CC044878C2; Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 22:48:44 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0e0e8c4fc1a5899138d99db47b809007a8bfd71a
X-Git-Newrev: d7a260f8bc94f1577006c0dab1e3289242039f4d
X-Patchwork-Hint: ignore
Message-Id: <20210803211028.CC044878C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] CHANGES: let's start by
 releasing -rc1, not -rc8
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7a260f8bc94f1577006c0dab1e3289242039f4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 CHANGES | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/CHANGES b/CHANGES
index 9c0b1b19b9..0513838315 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,4 +1,4 @@
-2021.08-rc8, to be released
+2021.08-rc1, to be released
 
 	Numerous package updates.
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
