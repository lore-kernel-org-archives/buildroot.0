Return-Path: <SRS0=zSif=MV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC6FC4320A
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 21:02:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21DB560EC0
	for <buildroot@archiver.kernel.org>; Thu, 29 Jul 2021 21:02:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21DB560EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC3A04069E;
	Thu, 29 Jul 2021 21:02:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KvyVm0O14sIs; Thu, 29 Jul 2021 21:02:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16C3740698;
	Thu, 29 Jul 2021 21:02:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B2941BF380
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 21:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 881258355C
 for <buildroot@lists.busybox.net>; Thu, 29 Jul 2021 21:02:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7yrJc9Mz2xzg for <buildroot@lists.busybox.net>;
 Thu, 29 Jul 2021 21:02:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AD3F883495
 for <buildroot@buildroot.org>; Thu, 29 Jul 2021 21:02:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E1D0B8A267; Thu, 29 Jul 2021 20:27:15 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 29 Jul 2021 23:01:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e789e96bb869b7b1e3e54a262399848214c6313
X-Git-Newrev: 0a954d441218daa6bbafb74d30539e6b14f193b8
X-Patchwork-Hint: ignore
Message-Id: <20210729202715.E1D0B8A267@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/resources.txt: change pastebin
 site URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a954d441218daa6bbafb74d30539e6b14f193b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

code.bulix.org no longer exists, suggest paste.ack.tf instead, as an
example.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/resources.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/resources.txt b/docs/manual/resources.txt
index e621b6b069..e90a49b2ab 100644
--- a/docs/manual/resources.txt
+++ b/docs/manual/resources.txt
@@ -32,7 +32,7 @@ hosted on https://www.oftc.net/WebChat/[OFTC]. It is a useful place to
 ask quick questions or discuss on certain topics.
 +
 When asking for help on IRC, share relevant logs or pieces of code
-using a code sharing website, such as http://code.bulix.org.
+using a code sharing website, such as https://paste.ack.tf/.
 +
 Note that for certain questions, posting to the mailing list may be
 better as it will reach more people, both developers and users.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
