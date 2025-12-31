Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D3AEE642E
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 11:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D67280F52;
	Wed, 31 Dec 2025 11:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y9Cyl6H-GLjR; Wed, 31 Dec 2025 11:51:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55A1480DFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767181895;
	bh=KsEOyblRs1MxGH18+/srXhLx8YhM7TfmjQyt4nzQ06U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Exk+kM6YBUVA0JEfiqFlc05XlrB4KP9J6hhggKcrtPIK3aMirH62jwBQztO980QIt
	 2jUaeOpmgqNfQMCKM4T9lws9BKv/u10PgecdRI7kh91R2ociRSG0aXn7zrgCqJj3x+
	 xKWy02vqljSisEd493p0UTyfgruVkeuOoIR343UhORwpxUMvSjF+VVBASr15HjCdOK
	 tFcD1fiHd9yU58M8Uqg1D/Z58WEcGUy4nSJeAeS18oerO8Whpk3oLil9kig926UYz+
	 YJ37jETWiAqyynIxxcyhJwzYRomVyxvC5XdjU01isLrw3xXFuQG9c+luP2g/JS3BXz
	 lKHYAoD3aDpuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55A1480DFC;
	Wed, 31 Dec 2025 11:51:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9738A177
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 11:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93ED04006B
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 11:51:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y-Gqe3aT30CZ for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 11:51:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0FE64009D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0FE64009D
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 11:51:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8EA2187DAD; Wed, 31 Dec 2025 11:51:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 31 Dec 2025 12:26:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6131b31fbdd0575b9ac543d7e106ea1a64f9a62a
X-Git-Newrev: 5c6552cd60b82cbfac6918de296772b2f37c35a1
X-Patchwork-Hint: ignore
Message-Id: <20251231115129.8EA2187DAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Giulio Benetti to Putty
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=5c6552cd60b82cbfac6918de296772b2f37c35a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6a6c3ad8f8..8009686556 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1316,6 +1316,7 @@ F:	package/minicom/
 F:	package/mongoose/
 F:	package/mmc-utils/
 F:	package/nfs-utils/
+F:	package/putty/
 F:	package/python-libconf/
 F:	package/python-uvloop/
 F:	package/qt5/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
