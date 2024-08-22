Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC3FC52D7C
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 14:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1E4F81970;
	Thu, 22 Aug 2024 14:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9sm86v8Qiyr1; Thu, 22 Aug 2024 14:26:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7CB781971
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7CB781971;
	Thu, 22 Aug 2024 14:26:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 066431BF36D
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 14:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E77F040E89
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 14:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ieGuF3zlB5-2 for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 14:26:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1CA040022
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1CA040022
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 14:26:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8FFE85C1D; Thu, 22 Aug 2024 14:26:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 16:26:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f1725c4cc29fd91d05ca385c5c0cc531f295a38
X-Git-Newrev: 91cd1bef728c8d2850504a66fdae89af5c0ef258
X-Patchwork-Hint: ignore
Message-Id: <20240822142642.D8FFE85C1D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: add new defconfigs missing from
 2024.08-rc1
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

commit: https://git.buildroot.net/buildroot/commit/?id=91cd1bef728c8d2850504a66fdae89af5c0ef258
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 84245655eb..d5c5badaf1 100644
--- a/CHANGES
+++ b/CHANGES
@@ -14,8 +14,9 @@
 	  fuzz is accepted anymore.
 	- Improvements to the canonical example of SysV init script
 
-	New defconfigs: arm_fvp_ebbr, beaglev_fire, cubieboard1,
-	imx6ulz_bsh_smm_m2_defconfig, spike_riscv32,
+	New defconfigs: arm_fvp_ebbr, beagleplay, beaglev_fire,
+	cubieboard1, imx6ulz_bsh_smm_m2_defconfig, raspberrypi5,
+	spike_riscv32. ti_am62ax_sk, versal_vpk180
 
 	Removed defconfigs: beagleboardx15, beaglev, imx8mpico
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
