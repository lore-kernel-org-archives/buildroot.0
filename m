Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 969BEC4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:22:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 530E560D07
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 530E560D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 114E94026E;
	Thu,  5 Aug 2021 19:22:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pVUQBEp0V8KN; Thu,  5 Aug 2021 19:22:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37F2F400D7;
	Thu,  5 Aug 2021 19:22:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EB341C1148
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37ADC4026E
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:21:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WvhAK1Irg_px for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:21:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69630400D7
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:21:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 309738B8B7; Thu,  5 Aug 2021 19:21:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 5 Aug 2021 21:20:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e39ad96136a8c340b3aea6b036024e28f14584f3
X-Git-Newrev: 344101ddb1d4531f7d41e4e1206b581804b86bb9
X-Patchwork-Hint: ignore
Message-Id: <20210805192130.309738B8B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Giulio Benetti to libfuse3
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=344101ddb1d4531f7d41e4e1206b581804b86bb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add myself as libfuse3 package maintainer.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1547ff123b..bb39abefab 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1052,6 +1052,7 @@ F:	package/xapian/
 
 N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
 F:	package/at/
+F:	package/libfuse3/
 F:	package/libnspr/
 F:	package/libnss/
 F:	package/minicom/
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
