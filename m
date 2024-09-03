Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C38CD37AB
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 18:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 82B3040A64;
	Tue,  3 Sep 2024 18:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZIj-Q-kyNtkW; Tue,  3 Sep 2024 18:38:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8464A40A56
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8464A40A56;
	Tue,  3 Sep 2024 18:38:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D14C1BF97A
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2718340A02
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wwQxGGWHpj7d for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 18:38:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23940404C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23940404C8
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 18:38:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F5EF86AB8; Tue,  3 Sep 2024 18:38:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 20:07:06 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 7389a013007d421c56934e8f8908d1cbbc94a630
X-Git-Newrev: 84202115a298f70f7545220a4996dad31e82ed31
X-Patchwork-Hint: ignore
Message-Id: <20240903183810.0F5EF86AB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] DEVELOPERS: remove Maeva
 Manuel
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

commit: https://git.buildroot.net/buildroot/commit/?id=84202115a298f70f7545220a4996dad31e82ed31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Maeva told me personally she will no longer contribute to Buildroot
for the time being. This commit removes all the associated DEVELOPERS
entries.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 92d652df4869d073e383d9d44b5c43e338d83c29)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6aaaa6ca7f..39eb895f64 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2095,11 +2095,6 @@ N:	Ludwig Kormann <ludwig.kormann@ict42.de>
 F:	board/in-circuit/
 F:	configs/icnova*
 
-N:	Maeva Manuel <maeva.manuel@oss.nxp.com>
-F:	board/freescale/imx8qmmek/
-F:	configs/freescale_imx8qmmek_defconfig
-F:	package/freescale-imx/imx-seco/
-
 N:	Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
 F:	package/ffmpeg/
 F:	package/mpv/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
