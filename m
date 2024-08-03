Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35D2C3DA4A
	for <buildroot@archiver.kernel.org>; Sat,  3 Aug 2024 09:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 617378198A;
	Sat,  3 Aug 2024 09:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ZxaZO1Vhxux; Sat,  3 Aug 2024 09:51:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70C5481990
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70C5481990;
	Sat,  3 Aug 2024 09:51:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 08BE61BF378
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 09:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EADD9605FF
 for <buildroot@lists.busybox.net>; Sat,  3 Aug 2024 09:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YZgtSehG79iS for <buildroot@lists.busybox.net>;
 Sat,  3 Aug 2024 09:51:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11949605AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11949605AD
 for <buildroot@buildroot.org>; Sat,  3 Aug 2024 09:51:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F04178372F; Sat,  3 Aug 2024 09:51:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Aug 2024 11:51:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d95b4db8633a9b928f9a12e428125c91551a3eae
X-Git-Newrev: 92d652df4869d073e383d9d44b5c43e338d83c29
X-Patchwork-Hint: ignore
Message-Id: <20240803095141.F04178372F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Maeva Manuel
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

commit: https://git.buildroot.net/buildroot/commit/?id=92d652df4869d073e383d9d44b5c43e338d83c29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Maeva told me personally she will no longer contribute to Buildroot
for the time being. This commit removes all the associated DEVELOPERS
entries.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4d26885a1b..6c1fc7fc8e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2136,11 +2136,6 @@ N:	Ludwig Kormann <ludwig.kormann@ict42.de>
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
