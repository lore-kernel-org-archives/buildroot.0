Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A766C54EBC
	for <buildroot@archiver.kernel.org>; Thu, 12 Jan 2023 10:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9DAA640235;
	Thu, 12 Jan 2023 10:47:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DAA640235
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NZjCBv2tlExK; Thu, 12 Jan 2023 10:47:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E68B8405B8;
	Thu, 12 Jan 2023 10:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E68B8405B8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF3161BF476
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 10:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7C7381777
 for <buildroot@lists.busybox.net>; Thu, 12 Jan 2023 10:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7C7381777
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g1TjJjwnn8S6 for <buildroot@lists.busybox.net>;
 Thu, 12 Jan 2023 10:47:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 148148177C
 for <buildroot@buildroot.org>; Thu, 12 Jan 2023 10:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 148148177C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 005328798E; Thu, 12 Jan 2023 10:47:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Jan 2023 11:44:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fce9f0eea00ed9aaeca12c1529ea380617baa477
X-Git-Newrev: 24c532c9f6885174ddf1a9621cc1d55412139676
X-Patchwork-Hint: ignore
Message-Id: <20230112104725.005328798E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Bartosz Golaszewski
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

commit: https://git.buildroot.net/buildroot/commit/?id=24c532c9f6885174ddf1a9621cc1d55412139676
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's been a while since I've even used buildroot at all and I don't
really have any spare cycles to spend on maintaining its packages.
Let's face reality and drop me from the DEVELOPERS file.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 86e3f0e7b1..8e1d68c026 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -283,17 +283,6 @@ F:	package/ttyd/
 F:	package/qt5/qt5scxml/
 F:	package/qt5/qt5webview/
 
-N:	Bartosz Golaszewski <brgl@bgdev.pl>
-F:	package/autoconf-archive/
-F:	package/doxygen/
-F:	package/libgpiod/
-F:	package/libserialport/
-F:	package/libsigrok/
-F:	package/libsigrokdecode/
-F:	package/libzip/
-F:	package/pulseview/
-F:	package/sigrok-cli/
-
 N:	Baruch Siach <baruch@tkos.co.il>
 F:	board/solidrun/clearfog_gt_8k/
 F:	configs/solidrun_clearfog_gt_8k_defconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
