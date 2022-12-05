Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BF9C47089
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 08:22:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9C5F404DA;
	Mon,  5 Dec 2022 08:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9C5F404DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7IFomafiSq_7; Mon,  5 Dec 2022 08:22:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F62C4047C;
	Mon,  5 Dec 2022 08:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F62C4047C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 772F91BF2EA
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 08:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50FDD409DD
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 08:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50FDD409DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x4dvTTxB-J0Y for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 08:22:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51CF44095F
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 08:22:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51CF44095F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D67E857AC; Mon,  5 Dec 2022 08:22:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Dec 2022 09:20:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6aca1d4d70bfe0b8a627d9e08692b36dd19a92d2
X-Git-Newrev: e40f96af34e3706fff2ebd6e9a6cebd14091d4ca
X-Patchwork-Hint: ignore
Message-Id: <20221205082243.3D67E857AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Sven Haardiek
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
