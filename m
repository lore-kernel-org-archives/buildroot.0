Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA19C6FA89
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 14:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0380E60EA1;
	Tue, 13 Sep 2022 14:53:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0380E60EA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 94vv5w7NT1G1; Tue, 13 Sep 2022 14:53:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26DBE606F9;
	Tue, 13 Sep 2022 14:53:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26DBE606F9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE9861BF2F3
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A80F6600CB
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 14:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A80F6600CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id arD4PWyXQ6Td for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 14:52:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2755060E90
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 14:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2755060E90
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 102008380F; Tue, 13 Sep 2022 14:52:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 16:43:32 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: af2ecf8e8dd212791bae7f8a549007a1f3ee6b99
X-Git-Newrev: 47de8ffc063142bea2e10db9ede80c6be0bfbabd
X-Patchwork-Hint: ignore
Message-Id: <20220913145251.102008380F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] DEVELOPERS: remove
 useless whitespaces before tabs
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

commit: https://git.buildroot.net/buildroot/commit/?id=47de8ffc063142bea2e10db9ede80c6be0bfbabd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ef036f066d25f95ca75d287bc346e96466d6ccf2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index f9c519a14a..adacc680f7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2686,8 +2686,8 @@ F:	board/pine64/rockpro64
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
