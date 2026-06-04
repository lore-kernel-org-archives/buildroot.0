Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F962CD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42C9D40F36;
	Fri,  5 Jun 2026 12:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEAMaTNp8eS8; Fri,  5 Jun 2026 12:38:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A9FE40F37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663082;
	bh=s4sZoq6oocnh8vuGENN2Fm1QfcjyEhLDQFK4a8VDlbY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FQSg+kD9m8ZHcM07D17aknf8fFyeFpE0rekvV9HECblofjMYVqw8dgc4cmNpvXPSi
	 TOI8iPG7YpO/qq97wat7smAxj05pgpHtoVANOXgrYTfO1WDY2E+4B+/3DHlgtcrp2o
	 EQvrPO0ka1pX5vazzm0plgk4bezrwYcPWNObeyvG6UFTrIsuJVIdev7LiFmfCJSwA3
	 moxuWx+gE0AXjiW55f7qG93iGmQS9WdpOP0/hhJWSQh1etyobetRpcxtEqDbEakSU3
	 jv5Bv6fJp+A8Qwh3yRDBeUywWdPR7/sE59aq5RhgdnRMPKxdqPls4bhgASH4fsJCEy
	 AO7HPdETdYQow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A9FE40F37;
	Fri,  5 Jun 2026 12:38:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 06189388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA76881E63
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mC2EMZnv4goK for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0DE081E7A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0DE081E7A
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06A6287B40; Fri,  5 Jun 2026 12:37:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:46:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6d3ada40a8590af5769636e612f7c794f6b50f59
X-Git-Newrev: b866ab891eb1ac8294940c90e772b187ba081f7a
X-Patchwork-Hint: ignore
Message-Id: <20260605123712.06A6287B40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: drop John
 Faith, email bounces
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b866ab891eb1ac8294940c90e772b187ba081f7a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 758e5cdbddddcc41149e78626e12b834d288fa29)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index d73e28239c..908b3b1a3b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1660,10 +1660,6 @@ F:	package/vuejs/
 N:	John Stile <johns@msli.com>
 F:	package/dhcpcd/
 
-N:	John Faith <jfaith@impinj.com>
-F:	package/python-inflection/
-F:	package/sdbusplus/
-
 N:	Jon Ringle <jringle@gridpoint.com>
 F:	package/mbpoll/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
