Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D76FC54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 491EB810A0;
	Fri, 31 Jul 2026 11:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8j9ahOy0NVkL; Fri, 31 Jul 2026 11:56:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6492D80F91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499010;
	bh=1mzgY6kGvqnbgdchcwtjdSmcj2U+zSPe0mb2favLyyM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Wp4M1cOGJLHBJXbFM5PvI0J3DVB5PXGw1Tw43H9pVPch4ZefAhVHLFUJubt+77rAT
	 4nzTx+m7mu7mDVVLhOAclXUrzfqhWa21QeC4Xpp0wj2gbTwHXBO5tsUsiV060K2Iyh
	 T1bJDscFLslV3368Jy/aJ2F3DtiNMZGPZEy8Txt2xJLLe7znpXuISXTsviOhndcGIc
	 1hcuNp0FjR5ARmNqk7wk1sGbkF7i2xfuX5B6GSyl8u3uuMtJ6baPkdsDp2BCQEpdWU
	 XFK0GL5EE19YYsj0mN0P2RcqGXPE21Kn8unK1sUkhZ1JtaZrBd8AMxVp+m7EMxNxi6
	 ZyqEpF9XKRDiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6492D80F91;
	Fri, 31 Jul 2026 11:56:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EAE569
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90769810B5
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oN1yAW2esmw1 for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:56:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79E8B81097
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79E8B81097
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5DE9A8B742; Fri, 31 Jul 2026 11:56:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 11:43:06 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: b4bb48dfebe3f80998c61ba1e36793b8d9c0307a
X-Git-Newrev: e70ba3effcb50938f2cd244802d772bdab347912
X-Patchwork-Hint: ignore
Message-Id: <20260731115605.5DE9A8B742@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] DEVELOPERS: update email
 for Francois Perrad
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e70ba3effcb50938f2cd244802d772bdab347912
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit aa56f063fd5a4079b7360f17437ed75435d5688f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7064e4c281..c9df146712 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1162,7 +1162,7 @@ F:	board/visionfive2/
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
