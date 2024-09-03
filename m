Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF705CD37AC
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 20:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 683FB40425;
	Tue,  3 Sep 2024 20:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O1u-pAM6lAXx; Tue,  3 Sep 2024 20:40:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CE14402D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CE14402D5;
	Tue,  3 Sep 2024 20:40:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 863CA1BF95D
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72EF64026A
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 20:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QDDM4g1u22VO for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 20:40:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 801D74024A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 801D74024A
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 20:40:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A74C86C07; Tue,  3 Sep 2024 20:40:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 22:34:48 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: f1387b8003ba6e881efa214d0ef9f3227f10d9ca
X-Git-Newrev: cf09b890c9b34b69d36879ed25adb259becca0c1
X-Patchwork-Hint: ignore
Message-Id: <20240903204043.6A74C86C07@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] DEVELOPERS: drop Ariel
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf09b890c9b34b69d36879ed25adb259becca0c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

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
index 09de5c823b..c3b1d66b01 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -258,12 +258,6 @@ F:	configs/snps_archs38_axs103_defconfig
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
