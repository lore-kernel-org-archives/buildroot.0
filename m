Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301AACF2579
	for <buildroot@archiver.kernel.org>; Sun, 13 Oct 2024 10:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F05EA40A93;
	Sun, 13 Oct 2024 10:49:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iUz2NTh-pP6f; Sun, 13 Oct 2024 10:49:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3F7840A00
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3F7840A00;
	Sun, 13 Oct 2024 10:49:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9AA451BF35D
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89F9880DE2
 for <buildroot@lists.busybox.net>; Sun, 13 Oct 2024 10:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z1kV6n5VmGkE for <buildroot@lists.busybox.net>;
 Sun, 13 Oct 2024 10:49:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DC6E80D44
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DC6E80D44
 for <buildroot@buildroot.org>; Sun, 13 Oct 2024 10:49:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A53E85F8E; Sun, 13 Oct 2024 10:49:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Oct 2024 12:48:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6686987ba34ca301d5b4122c09589afa7dc821f
X-Git-Newrev: 0ad7035fce67cbe91db9dea7d81e6a4bc0691ad1
X-Patchwork-Hint: ignore
Message-Id: <20241013104907.7A53E85F8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Dario Binacchi for aespipe
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ad7035fce67cbe91db9dea7d81e6a4bc0691ad1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 44b1947487..2d9bcc2c87 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -795,6 +795,7 @@ F:	configs/imx8mn_bsh_smm_s2_defconfig
 F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
 F:	configs/stm32f746_disco_sd_defconfig
 F:	configs/stm32f769_disco_sd_defconfig
+F:	package/aespipe/
 F:	package/armadillo/
 F:	package/babeld/
 F:	package/iana-assignments/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
