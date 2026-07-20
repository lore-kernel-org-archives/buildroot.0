Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CB2C44520
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 19:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C07498096C;
	Mon, 20 Jul 2026 19:24:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SgsBG4wDmaH1; Mon, 20 Jul 2026 19:24:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB5D38088A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784575486;
	bh=cKf2l2ZkukJ9Xk57IEgK3iKoYoLOAwMGstxYEScDzmo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jWocIMKmpvg+uHkqbldisNTqTKzHltK7X76CwN5IhoiQ+AzBhXsa8OriPKJ7SYAt/
	 r2jSFWu4RFXqq4Usm6/K4L7dKbEvuaz17pO4znPkoB7B/Nv2s6fyjc2YPUy3jXLHSu
	 QvClBZBsQlF9R99FyrfbFKRyIaYPTGwCUfK4X2tFnPAAyGO00+87MR8Q2QLDJZtkw+
	 c4vV5Y6yW/Kzz4FRau1MGq2vC5S7Rd4J0n1mX6Wm2gZ/4D/HdonPGIXktW8y/Nu4ku
	 XAEhFAfCGppFdsQshWXJXFSY7eGMHRMgV2xDrtysrd6prnkiFZjO4zxnpsdFq4rUiv
	 EneaKoOA4DYrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB5D38088A;
	Mon, 20 Jul 2026 19:24:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BE960313
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A51C54016F
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6tPZb3_ea4u7 for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 19:24:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CC5440167
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CC5440167
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 19:24:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5AC389071; Mon, 20 Jul 2026 19:24:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Jul 2026 21:23:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf8880b354fec8191d64ebfc8c3ab97e3838f560
X-Git-Newrev: aa56f063fd5a4079b7360f17437ed75435d5688f
X-Patchwork-Hint: ignore
Message-Id: <20260720192405.D5AC389071@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: update email for Francois
 Perrad
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aa56f063fd5a4079b7360f17437ed75435d5688f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index a0749646cc..75fcdbef2e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1170,7 +1170,7 @@ F:	board/visionfive2/
 F:	configs/sipeed_licheepi_nano_defconfig
 F:	configs/visionfive2_defconfig
 
-N:	Francois Perrad <francois.perrad@gadz.org>
+N:	Francois Perrad <francois.perrad.86@gmail.com>
 F:	board/olimex/a20_olinuxino
 F:	board/olimex/imx233_olinuxino/
 F:	board/olimex/stmp1_olinuxino/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
