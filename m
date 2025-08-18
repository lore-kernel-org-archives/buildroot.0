Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB197CA0EE4
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 21:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83A6A403D7;
	Mon, 18 Aug 2025 21:36:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bj94R0My4czJ; Mon, 18 Aug 2025 21:36:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0850403F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0850403F5;
	Mon, 18 Aug 2025 21:36:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB511E2
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 21:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD15F40211
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 21:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WgNw2L8lnbe1 for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 21:36:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 155BD40271
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 155BD40271
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 21:36:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0EB6881359; Mon, 18 Aug 2025 21:36:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 Aug 2025 23:35:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c688a1a8a833a89e9e6fcef70f183766e341e11d
X-Git-Newrev: 3c93cf106caeb9bda4ddfd81c5c377e9bc461bfb
X-Patchwork-Hint: ignore
Message-Id: <20250818213608.0EB6881359@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Suniel Mahesh,
 boucing e-mail
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c93cf106caeb9bda4ddfd81c5c377e9bc461bfb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Suniel's e-mail address at Amarula Solutions is bouncing, so let's
drop this stale entry:

<sunil@amarulasolutions.com>: host aspmx.l.google.com[142.250.27.26] said:
    550-5.1.1 The email account that you tried to reach does not exist. Please
    try 550-5.1.1 double-checking the recipient's email address for typos or
    550-5.1.1 unnecessary spaces. For more information, go to 550 5.1.1
    https://support.google.com/mail/?p=NoSuchUser
    a640c23a62f3a-afcdce6d5e1si493680166b.9 - gsmtp (in reply to RCPT TO
    command)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index a28f3e8d57..3efad36d70 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3186,13 +3186,6 @@ N:	Steven Noonan <steven@uplinklabs.net>
 F:	package/hwloc/
 F:	package/powertop/
 
-N:	Suniel Mahesh <sunil@amarulasolutions.com>
-F:	board/pine64/rockpro64
-F:	board/radxa/rockpi-n8
-F:	configs/rock_pi_n8_defconfig
-F:	configs/rockpro64_defconfig
-F:	package/arm-gnu-toolchain/
-
 N:	Sven Oliver Moll <svolli@svolli.de>
 F:	package/most/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
