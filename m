Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FE6CD37AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4C4E40570;
	Tue,  3 Sep 2024 20:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4eyJBF0D87LJ; Tue,  3 Sep 2024 20:42:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C51564028F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C51564028F;
	Tue,  3 Sep 2024 20:42:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5268B1BF57B
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFB7F80EB9
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9u059zuwMim1 for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:41:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3C3580EC1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3C3580EC1
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:41:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 998F186CB0; Tue,  3 Sep 2024 20:41:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 22:34:36 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: a3c471ded743a4f928355369d81037e726bfe7b2
X-Git-Newrev: 5aa45c4e00d9197cda147dbb4b92d100cffff038
X-Patchwork-Hint: ignore
Message-Id: <20240903204146.998F186CB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] DEVELOPERS: drop Ariel
 D'Alessandro
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

commit: https://git.buildroot.net/buildroot/commit/?id=5aa45c4e00d9197cda147dbb4b92d100cffff038
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

<ariel@vanguardiasur.com.ar>: host aspmx.l.google.com[2a00:1450:400c:c07::1a]
    said: 550-5.2.1 The email account that you tried to reach is inactive. For
    more 550-5.2.1 information, go to 550 5.2.1
    https://support.google.com/mail/?p=DisabledUser
    ffacd0b85a97d-36bbd075381si7797549f8f.548 - gsmtp (in reply to RCPT TO
    command)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 53116d091562fb260460382fa295738323decf3d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index edd3c75cca..eaf1010747 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -251,12 +251,6 @@ F:	configs/snps_archs38_axs103_defconfig
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
