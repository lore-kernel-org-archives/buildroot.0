Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02676C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 17:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A43F42E75;
	Thu,  2 Nov 2023 17:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A43F42E75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VZ_EZfj7qHl0; Thu,  2 Nov 2023 17:50:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCE0442FC4;
	Thu,  2 Nov 2023 17:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCE0442FC4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FEBD1BF98E
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 17:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7490A43532
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 17:49:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7490A43532
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LWd2r7rvYiJT for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 17:49:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A5FF414E0
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 17:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A5FF414E0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42D5C86546; Thu,  2 Nov 2023 17:49:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Nov 2023 18:48:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf8062497504869d7ba8f4666179f4adde1cae0a
X-Git-Newrev: ed89c6a6cae82845b2abf8a2a7a26cb96153e45f
X-Patchwork-Hint: ignore
Message-Id: <20231102174953.42D5C86546@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Giulio Benetti for board
 Rockpro64
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ed89c6a6cae82845b2abf8a2a7a26cb96153e45f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 26b25edd98..d26fddd9b1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1203,6 +1203,7 @@ F:	board/bananapi/bananapi-m2-ultra/
 F:	board/freescale/imx6ullevk/
 F:	board/freescale/imxrt1050evk/
 F:	board/olimex/a*
+F:	board/pine64/rockpro64
 F:	configs/amarula_vyasa_rk3288_defconfig
 F:	configs/asus_tinker_rk3288_defconfig
 F:	configs/bananapi_m2_berry_defconfig
@@ -1211,6 +1212,7 @@ F:	configs/freescale_imx6ullevk_defconfig
 F:	configs/imx6ullevk_defconfig
 F:	configs/imxrt1050-evk_defconfig
 F:	configs/olimex_a*
+F:	configs/rockpro64_defconfig
 F:	package/at/
 F:	package/binutils/
 F:	package/cryptsetup/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
