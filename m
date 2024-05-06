Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A134C25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E034282276;
	Mon,  6 May 2024 20:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7k0wai4Y0g1; Mon,  6 May 2024 20:07:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83D8082302
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83D8082302;
	Mon,  6 May 2024 20:07:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 12E551BF33C
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D2DD4148E
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSCZjIOZYbew for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:06:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C68E414C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C68E414C2
 for <buildroot@buildroot.org>; Mon,  6 May 2024 20:06:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4907B868B6; Mon,  6 May 2024 20:06:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 May 2024 22:06:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: deede5e9dee8ba34a15919e95385cae1847d72b4
X-Git-Newrev: 35c7cc56441ea58834201c7d08026e05209fc1e9
X-Patchwork-Hint: ignore
Message-Id: <20240506200644.4907B868B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add myself to TI's packages
 and reference boards
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

commit: https://git.buildroot.net/buildroot/commit/?id=35c7cc56441ea58834201c7d08026e05209fc1e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add myself to the DEVELOPERS files to help review patches related to
TI's reference boards.

Signed-off-by: Bryan Brattlof <bb@ti.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3b19665a84..1c5ad1e42a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -551,6 +551,13 @@ F:	package/vmtouch/
 N:	Brock Williams <brock@cottonwoodcomputer.com>
 F:	package/pdmenu/
 
+N:	Bryan Brattlof <bb@ti.com>
+F:	board/ti/
+F:	boot/ti-k3-boot-firmware/
+F:	boot/ti-k3-r5-loader/
+F:	configs/ti_am62x_sk_defconfig
+F:	configs/ti_am64x_sk_defconfig
+
 N:	Carlo Caione <carlo.caione@gmail.com>
 F:	package/jailhouse/
 F:	package/sunxi-boards/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
