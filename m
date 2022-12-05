Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64557C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01A9B48D88;
	Mon, 20 Feb 2023 21:46:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01A9B48D88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WkPFOoLzvkpD; Mon, 20 Feb 2023 21:46:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B646D4EBD9;
	Mon, 20 Feb 2023 21:46:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B646D4EBD9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C16781BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A70F661108
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A70F661108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WQjFjf1IsUFw for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3DCE610E7
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3DCE610E7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EDF52828C8; Mon, 20 Feb 2023 20:51:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Dec 2022 09:20:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6aca1d4d70bfe0b8a627d9e08692b36dd19a92d2
X-Git-Newrev: e40f96af34e3706fff2ebd6e9a6cebd14091d4ca
X-Patchwork-Hint: ignore
Message-Id: <20230220205155.EDF52828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] DEVELOPERS: remove Sven
 Haardiek
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

commit: https://git.buildroot.net/buildroot/commit/?id=e40f96af34e3706fff2ebd6e9a6cebd14091d4ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

His e-mail address no longer exists:

Your message to sven.haardiek@iotec-gmbh.de couldn't be delivered.
sven.haardiek wasn't found at iotec-gmbh.de.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9da61cca13..7b5eda1615 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2728,10 +2728,6 @@ F:	configs/rock_pi_n8_defconfig
 F:	configs/rockpro64_defconfig
 F:	package/arm-gnu-toolchain/
 
-N:	Sven Haardiek <sven.haardiek@iotec-gmbh.de>
-F:	package/lcdproc/
-F:	package/python-influxdb/
-
 N:	Sven Oliver Moll <svolli@svolli.de>
 F:	package/most/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
