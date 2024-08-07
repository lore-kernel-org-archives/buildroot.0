Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6277DC3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 22:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 221F1403B6;
	Wed,  7 Aug 2024 22:16:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CFif4rAXk0g9; Wed,  7 Aug 2024 22:16:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE8F0406A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE8F0406A3;
	Wed,  7 Aug 2024 22:16:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B37761BF321
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 22:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1022406A3
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 22:16:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Di32lxedFu-7 for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 22:16:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B22F0403B6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B22F0403B6
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 22:16:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C50684706; Wed,  7 Aug 2024 22:16:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Aug 2024 00:16:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88e8f08fb676ab6c8d441f66d5ecbdac9bfff628
X-Git-Newrev: 53116d091562fb260460382fa295738323decf3d
X-Patchwork-Hint: ignore
Message-Id: <20240807221648.9C50684706@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: drop Ariel D'Alessandro
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

commit: https://git.buildroot.net/buildroot/commit/?id=53116d091562fb260460382fa295738323decf3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

<ariel@vanguardiasur.com.ar>: host aspmx.l.google.com[2a00:1450:400c:c07::1a]
    said: 550-5.2.1 The email account that you tried to reach is inactive. For
    more 550-5.2.1 information, go to 550 5.2.1
    https://support.google.com/mail/?p=DisabledUser
    ffacd0b85a97d-36bbd075381si7797549f8f.548 - gsmtp (in reply to RCPT TO
    command)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index a40201fb71..c52f53565c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -268,12 +268,6 @@ F:	configs/snps_archs38_axs103_defconfig
 F:	configs/snps_archs38_haps_defconfig
 F:	configs/snps_archs38_hsdk_defconfig
 
-N:	Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
-F:	board/bsh/
-F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
-F:	package/axfsutils/
-F:	package/mali-t76x/
-
 N:	Arnaud Aujon <arnaud@intelibre.fr>
 F:	package/espeak/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
