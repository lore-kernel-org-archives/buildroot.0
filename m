Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1993C433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Dec 2021 22:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9977B4067C;
	Mon, 20 Dec 2021 22:44:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oO4CEU35nzgC; Mon, 20 Dec 2021 22:44:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED91E40629;
	Mon, 20 Dec 2021 22:44:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C9A3E1BF5A6
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE6A3409B3
 for <buildroot@lists.busybox.net>; Mon, 20 Dec 2021 22:42:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N3_Yn4-bqAR1 for <buildroot@lists.busybox.net>;
 Mon, 20 Dec 2021 22:42:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 168EB409A8
 for <buildroot@buildroot.org>; Mon, 20 Dec 2021 22:42:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0E3D38289B; Mon, 20 Dec 2021 22:36:41 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 20 Dec 2021 23:06:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6000c027f99c5ba9baa1caca1f41e93b668f03c1
X-Git-Newrev: da6fbde369c74a6e04c486cc40e1058b203edba8
X-Patchwork-Hint: ignore
Message-Id: <20211220223641.0E3D38289B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add the
 stm32f469_disco_xip_defconfig entry
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=da6fbde369c74a6e04c486cc40e1058b203edba8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit a3e3d9c19829 ("configs/stm32f469_disco_xip_defconfig: alternative
defconfig for XIP configurations") forgot to add the corresponding entry
in the DEVELOPERS file.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>
Cc: Yauheni Saldatsenka <eugentoo@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4125adcddf..64db6c51d0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -531,6 +531,7 @@ F:	board/stmicroelectronics/stm32f429-disco/
 F:	board/stmicroelectronics/stm32f469-disco/
 F:	configs/stm32f429_disco_xip_defconfig
 F:	configs/stm32f469_disco_sd_defconfig
+F:	configs/stm32f469_disco_xip_defconfig
 
 N:	Christophe Vu-Brugier <cvubrugier@fastmail.fm>
 F:	package/drbd-utils/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
