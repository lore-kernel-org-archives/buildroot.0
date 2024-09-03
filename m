Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9FFCD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 18:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C8D9B40A1F;
	Tue,  3 Sep 2024 18:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wOaoAgldHdB3; Tue,  3 Sep 2024 18:44:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2E9440A63
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2E9440A63;
	Tue,  3 Sep 2024 18:44:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F30641BF95D
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC5F840A1F
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 18:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_uHPAksYIH6 for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 18:44:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E68BD40A02
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E68BD40A02
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 18:44:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE12686B0C; Tue,  3 Sep 2024 18:44:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 20:07:15 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 85f498fa8e40ad400e5df785826009ffcdc2922a
X-Git-Newrev: 92453b8029288859d8012e000933ba2ddc6a61db
X-Patchwork-Hint: ignore
Message-Id: <20240903184427.DE12686B0C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] DEVELOPERS: remove Maeva
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

commit: https://git.buildroot.net/buildroot/commit/?id=92453b8029288859d8012e000933ba2ddc6a61db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
index d1c4c6ece0..2582f1415b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2054,11 +2054,6 @@ N:	Ludwig Kormann <ludwig.kormann@ict42.de>
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
