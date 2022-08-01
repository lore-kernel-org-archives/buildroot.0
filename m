Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D309C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 17:05:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ADF960BA9;
	Mon,  1 Aug 2022 17:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4ADF960BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8uyp6BQWlxBw; Mon,  1 Aug 2022 17:05:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76A6C60B3B;
	Mon,  1 Aug 2022 17:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76A6C60B3B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D23E1BF33D
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 649EF8140B
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 649EF8140B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y9hDGghZ9Aoi for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 17:05:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF937813C2
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 17:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF937813C2
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C3AED86B1E; Mon,  1 Aug 2022 16:51:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Aug 2022 19:05:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6685b5ae643aa7f832cb1a5edf4e417125cb58ea
X-Git-Newrev: ef036f066d25f95ca75d287bc346e96466d6ccf2
X-Patchwork-Hint: ignore
Message-Id: <20220801165141.C3AED86B1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove useless whitespaces
 before tabs
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef036f066d25f95ca75d287bc346e96466d6ccf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 88e0d02c69..8bfe9b4d5c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2744,8 +2744,8 @@ F:	board/pine64/rockpro64
 F:	board/radxa/rockpi-4
 F:	board/radxa/rockpi-n8
 F:	board/radxa/rockpi-n10
-F: 	configs/friendlyarm_nanopc_t4_defconfig
-F: 	configs/friendlyarm_nanopi_m4_defconfig
+F:	configs/friendlyarm_nanopc_t4_defconfig
+F:	configs/friendlyarm_nanopi_m4_defconfig
 F:	configs/orangepi_rk3399_defconfig
 F:	configs/roc_pc_rk3399_defconfig
 F:	configs/rock_pi_4_defconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
